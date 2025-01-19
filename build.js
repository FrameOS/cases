#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const chokidar = require("chokidar");

// -------------------
// CONFIG / CONSTANTS
// -------------------
const DEFAULT_MODEL = "13in3e";
const ROOT = __dirname;
const MARK1_FILE = path.join(ROOT, "cases", "mark1.scad");
const OUT_FILE = path.join(ROOT, "dist", "out.scad");

// -------------------
// PARSE CLI ARGS
// -------------------
const args = process.argv.slice(2);
const watchMode = args.includes("--watch");

// The user can do: node build.js 7in3e --watch
// The first argument that isn't "--watch" is the model name
let modelName = DEFAULT_MODEL;
for (let arg of args) {
  if (!arg.startsWith("--")) {
    modelName = arg;
    break;
  }
}

const MODEL_FILE = path.join(ROOT, "models", `${modelName}.scad`);

// -------------------
// CORE BUILD FUNCTION
// -------------------
function build() {
  console.log(`Building with model "${modelName}"...`);

  // 1) Read and parse the model scad for variables
  if (!fs.existsSync(MODEL_FILE)) {
    console.error(`ERROR: Model file not found: ${MODEL_FILE}`);
    process.exit(1);
  }
  const modelContent = fs.readFileSync(MODEL_FILE, "utf8");
  const modelVars = parseVariables(modelContent);

  // 2) Read the mark1.scad
  if (!fs.existsSync(MARK1_FILE)) {
    console.error(`ERROR: mark1.scad file not found: ${MARK1_FILE}`);
    process.exit(1);
  }
  const mark1Content = fs.readFileSync(MARK1_FILE, "utf8");
  const mark1Lines = mark1Content.split("\n");

  // 3) Merge variables
  const finalLines = [];

  for (const line of mark1Lines) {
    const parsedLine = parseVariableLine(line);
    if (parsedLine) {
      const { name, comment } = parsedLine;
      // If model scad has a matching variable, override the line
      if (modelVars.hasOwnProperty(name)) {
        finalLines.push(`${name} = ${modelVars[name]};${comment}`);
      } else {
        // Otherwise, just keep the original line from mark1.scad
        finalLines.push(line);
      }
    } else {
      // Lines that are not variable assignments are preserved as-is
      finalLines.push(line);
    }
  }

  // 4) Write out the merged SCAD
  const output = finalLines.join("\n");
  fs.mkdirSync(path.dirname(OUT_FILE), { recursive: true });
  fs.writeFileSync(OUT_FILE, output, "utf8");

  console.log(`✔ Build complete. Written to ${OUT_FILE}`);
}

// -------------------
// HELPER: parseVariables
// -------------------
// Extracts variable lines (e.g. `foo = 12.3;`) from a SCAD string.
// Returns an object { foo: '12.3', bar: 'someExpression', ... }
function parseVariables(content) {
  const lines = content.split("\n");
  const vars = {};
  for (const line of lines) {
    const parsed = parseVariableLine(line);
    if (parsed) {
      vars[parsed.name] = parsed.value;
    }
  }
  return vars;
}

// -------------------
// HELPER: parseVariableLine
// -------------------
// Checks if a line is of form:
//   panel_width = 170.3;
//   someVar     = [0, 1, 2];
// Returns { name, value } or null
function parseVariableLine(line) {
  // A loose regex that captures "<varName> = <anything>;"
  const match = line.match(/^\s*([\w$][\w\d_$]*)\s*=\s*(.*);(.*)$/);
  if (!match) return null;
  const name = match[1];
  const value = match[2];
  const comment = match[3];
  return { name, value, comment };
}

// -------------------
// RUN BUILD
// -------------------
build();

// -------------------
// WATCH MODE
// -------------------
if (watchMode) {
  // Watch for changes in mark1 and any model .scad files
  const watcher = chokidar.watch(
    [
      MARK1_FILE,
      path.join(ROOT, "models", "*.scad"),
      path.join(ROOT, "build.js"),
    ],
    {
      ignoreInitial: true,
    }
  );

  watcher.on("change", (filePath) => {
    console.log(`File changed: ${filePath}`);
    build();
  });

  console.log("Watching for file changes...");
}
