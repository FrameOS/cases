#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const { spawnSync } = require("child_process");

const repoRoot = path.resolve(__dirname, "..");
const casesDir = path.join(repoRoot, "cases");
const outputDir = path.join(repoRoot, "visual-regressions");
const outputDirForGit = path.relative(repoRoot, outputDir);

const imageSize = process.env.FRAMEOS_VISUAL_IMG_SIZE || "4000,3000";
const colorscheme = process.env.FRAMEOS_VISUAL_COLORSCHEME || "Tomorrow";
const xvfbServerArgs =
  process.env.FRAMEOS_VISUAL_XVFB_SERVER_ARGS || defaultXvfbServerArgs();
const openscadCommand =
  process.env.FRAMEOS_OPENSCAD_COMMAND || findOpenSCADCommand();
const checkMode = process.argv.includes("--check");
const helpMode = process.argv.includes("--help") || process.argv.includes("-h");
const caseFilters = process.argv
  .slice(2)
  .filter((arg) => !arg.startsWith("-"));
const excludedScadFiles = new Set(["case1.scad", "hello.scad"]);

const angles = [
  { name: "iso-front", camera: "0,0,0,55,0,35,700" },
  { name: "iso-back", camera: "0,0,0,55,0,215,700" },
  { name: "top", camera: "0,0,0,0,0,0,700" },
  { name: "bottom", camera: "0,0,0,180,0,180,700" },
];

if (helpMode) {
  console.log(`Usage: node scripts/render-visual-regressions.js [--check] [case-filter ...]

Renders matching .scad files under cases/ into ${outputDirForGit}/. Case filters
match substrings in the relative .scad path. Excludes case1.scad and hello.scad.

Environment:
  FRAMEOS_VISUAL_IMG_SIZE       PNG size, default ${imageSize}
  FRAMEOS_VISUAL_COLORSCHEME    OpenSCAD colorscheme, default ${colorscheme}
  FRAMEOS_OPENSCAD_COMMAND      OpenSCAD CLI command, default ${openscadCommand}
  FRAMEOS_VISUAL_XVFB=0         Disable xvfb-run on Linux
  FRAMEOS_VISUAL_XVFB_SERVER_ARGS
                                Override xvfb-run server args, default ${xvfbServerArgs}
`);
  process.exit(0);
}

function defaultXvfbServerArgs() {
  const [width, height] = imageSize.split(",");
  return `-screen 0 ${width}x${height}x24 +extension GLX +render -noreset`;
}

function sortedEntries(directory) {
  return fs
    .readdirSync(directory, { withFileTypes: true })
    .sort((a, b) => a.name.localeCompare(b.name));
}

function findScadFiles(directory) {
  const files = [];

  for (const entry of sortedEntries(directory)) {
    if (entry.name.startsWith(".")) {
      continue;
    }

    const fullPath = path.join(directory, entry.name);
    if (entry.isDirectory()) {
      files.push(...findScadFiles(fullPath));
    } else if (entry.isFile() && entry.name.endsWith(".scad")) {
      files.push(fullPath);
    }
  }

  return files;
}

function commandExists(command) {
  const result = spawnSync(
    "sh",
    ["-c", 'command -v "$1" >/dev/null 2>&1', "sh", command],
    {
      cwd: repoRoot,
      encoding: "utf8",
    }
  );
  return result.status === 0;
}

function openscadEnvironment() {
  if (process.platform !== "linux") {
    return process.env;
  }

  return {
    ...process.env,
    LIBGL_ALWAYS_SOFTWARE: process.env.LIBGL_ALWAYS_SOFTWARE || "1",
  };
}

function findOpenSCADCommand() {
  for (const command of ["openscad-unstable", "openscad"]) {
    if (commandExists(command)) {
      return command;
    }
  }

  return "openscad-unstable";
}

function openscadInvocation(args) {
  const shouldUseXvfb =
    process.platform === "linux" &&
    process.env.FRAMEOS_VISUAL_XVFB !== "0" &&
    commandExists("xvfb-run");

  if (!shouldUseXvfb) {
    return { command: openscadCommand, args };
  }

  return {
    command: "xvfb-run",
    args: ["-a", "-s", xvfbServerArgs, openscadCommand, ...args],
  };
}

function snapshotPath(scadFile, angleName) {
  const relativeScad = path.relative(casesDir, scadFile);
  const relativeWithoutExtension = relativeScad.replace(/\.scad$/, "");
  return path.join(outputDir, relativeWithoutExtension, `${angleName}.png`);
}

function snapshotDirectory(scadFile) {
  return path.dirname(snapshotPath(scadFile, "snapshot.png"));
}

function openscadArgs(scadFile, destination, angle) {
  return [
    "-o",
    destination,
    `--imgsize=${imageSize}`,
    `--camera=${angle.camera}`,
    "--autocenter",
    "--viewall",
    "--projection=o",
    `--colorscheme=${colorscheme}`,
    "--render=true",
    scadFile,
  ];
}

function runOpenSCAD(args) {
  const { command, args: finalArgs } = openscadInvocation(args);
  return spawnSync(command, finalArgs, {
    cwd: repoRoot,
    encoding: "utf8",
    env: openscadEnvironment(),
    maxBuffer: 64 * 1024 * 1024,
  });
}

function outputFor(result) {
  return [result.stdout, result.stderr].filter(Boolean).join("");
}

function render(scadFile, angle) {
  const destination = snapshotPath(scadFile, angle.name);
  fs.mkdirSync(path.dirname(destination), { recursive: true });

  const result = runOpenSCAD(openscadArgs(scadFile, destination, angle));
  const output = outputFor(result);

  if (result.error && result.error.code === "ENOENT") {
    console.error(
      `Missing ${openscadCommand}. Run this through the Flox environment: flox activate -- npm run render:visual`
    );
    process.exit(1);
  }

  if (result.status !== 0) {
    process.stderr.write(output);
    console.error(
      `Failed rendering ${path.relative(repoRoot, scadFile)} (${angle.name}).`
    );
    process.exit(result.status || 1);
  }

  const stats = fs.statSync(destination);
  if (stats.size === 0) {
    console.error(`OpenSCAD wrote an empty snapshot: ${destination}`);
    process.exit(1);
  }
}

function assertSnapshotsClean() {
  const status = spawnSync("git", ["status", "--short", "--", outputDirForGit], {
    cwd: repoRoot,
    encoding: "utf8",
  });

  if (status.error && status.error.code === "ENOENT") {
    console.error("Missing git; run the check through the Flox environment.");
    process.exit(1);
  }

  if (status.status !== 0) {
    process.stderr.write(status.stderr || "");
    process.exit(status.status || 1);
  }

  if (status.stdout.trim() !== "") {
    console.error("Visual regression snapshots are out of date:");
    process.stderr.write(status.stdout);
    console.error(
      "\nRun `flox activate -- npm run render:visual` and commit the resulting PNG changes."
    );
    process.exit(1);
  }
}

const allScadFiles = findScadFiles(casesDir).filter((scadFile) => {
  const relativeScad = path.relative(casesDir, scadFile);
  return !excludedScadFiles.has(relativeScad);
});
const scadFiles =
  caseFilters.length === 0
    ? allScadFiles
    : allScadFiles.filter((scadFile) => {
        const relativeScad = path.relative(casesDir, scadFile);
        return caseFilters.some((caseFilter) =>
          relativeScad.includes(caseFilter)
        );
      });

if (scadFiles.length === 0) {
  console.error(
    caseFilters.length === 0
      ? "No .scad files found under cases/."
      : `No .scad files matched: ${caseFilters.join(", ")}`
  );
  process.exit(1);
}

fs.mkdirSync(outputDir, { recursive: true });
if (caseFilters.length === 0) {
  fs.rmSync(outputDir, { recursive: true, force: true });
  fs.mkdirSync(outputDir, { recursive: true });
} else {
  for (const scadFile of scadFiles) {
    fs.rmSync(snapshotDirectory(scadFile), { recursive: true, force: true });
  }
}

console.log(
  `Rendering ${scadFiles.length} of ${allScadFiles.length} OpenSCAD files from ${path.relative(
    repoRoot,
    casesDir
  )}/ at ${angles.length} angles...`
);

for (const scadFile of scadFiles) {
  const relativeScad = path.relative(repoRoot, scadFile);
  for (const angle of angles) {
    console.log(`- ${relativeScad} (${angle.name})`);
    render(scadFile, angle);
  }
}

if (checkMode) {
  assertSnapshotsClean();
}

console.log(`Wrote ${scadFiles.length * angles.length} snapshots.`);
