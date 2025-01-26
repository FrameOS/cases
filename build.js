// Take all files in "cases/" and its subdirectories
// and create "dist/cases.json" with { "relative/path/to/file.scad": content }

const fs = require("fs");
const path = require("path");

const models = {};
const dir = path.join(__dirname, "cases");

function readDirRecursively(directory, relativePath = "") {
  const entries = fs.readdirSync(directory, { withFileTypes: true });

  for (const entry of entries) {
    if (entry.name.startsWith(".")) {
      // Skip hidden files and directories
      continue;
    }
    const fullPath = path.join(directory, entry.name);
    const relativeFilePath = path.join(relativePath, entry.name);

    if (entry.isDirectory()) {
      // Recursively read subdirectories
      readDirRecursively(fullPath, relativeFilePath);
    } else if (entry.isFile()) {
      // Read and store file content
      models[relativeFilePath] = fs.readFileSync(fullPath, "utf-8");
    }
  }
}

readDirRecursively(dir);

// Ensure the "dist" directory exists
fs.mkdirSync(path.join(__dirname, "dist"), { recursive: true });

// Write models object to "models.json"
fs.writeFileSync(
  path.join(__dirname, "dist", "cases.json"),
  JSON.stringify(models, null, 2) // Pretty print JSON for easier readability
);

// openscad playground
const playgroundDir = path.join(__dirname, "..", "openscad-playground", "src");

// copy dist/cases.json to ../openscad-playground/src/cases.json
if (!fs.existsSync(playgroundDir)) {
  fs.copyFileSync(
    path.join(__dirname, "dist", "cases.json"),
    path.join(playgroundDir, "cases.json")
  );
}

console.log("Cases have been built successfully!");
