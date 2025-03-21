const fs = require("fs");
const path = require("path");

const OUTPUT_FILE = "index.md";
const IGNORE_FILES = new Set([OUTPUT_FILE, "README.md"]);

// Function to safely encode URLs (Handle spaces and special characters in filenames)
function encodeURL(filePath) {
    return encodeURIComponent(filePath).replace(/%2F/g, "/");
}

// Function to compute relative path to `index.md`
function getRelativePath(file, baseDir = ".") {
    let filePath = path.relative(baseDir, file).replace(/\\/g, "/"); // Correct the relative path
    if (filePath === "") {
        return "./" + OUTPUT_FILE;  // If it's in the base folder
    }
    // Replace subfolder path with necessary `../` to navigate back to index.md
    return "../".repeat(filePath.split("/").length - 1) + OUTPUT_FILE;
}

// Function to add or update "Back to Index" at the top of Markdown files
function addBackLinks(file, baseDir = ".") {
    let content = fs.readFileSync(file, "utf-8");
    let backLink = `[🔙 Back to Index](${getRelativePath(file, baseDir)})\n\n`;

    // Remove existing back links (to avoid duplicates)
    content = content.replace(/^(\[🔙 Back to Index\]\(.*\)\n\n)/, "");

    // Prepend new back link
    content = backLink + content;

    fs.writeFileSync(file, content);
}

// Function to extract numeric prefix from file names
function extractNumericPrefix(fileName) {
    const match = fileName.match(/^(\d+)/);  // Match leading digits
    return match ? parseInt(match[1], 10) : Infinity;  // Return a large number if no numeric prefix
}

// Function to compare files numerically (and alphabetically if necessary)
function compareFiles(a, b) {
    const numA = extractNumericPrefix(path.basename(a));
    const numB = extractNumericPrefix(path.basename(b));

    // First, compare numerically based on the extracted prefix
    if (numA !== numB) {
        return numA - numB;  // Sort numerically first
    }

    // If numbers are the same, sort alphabetically by the rest of the file name
    return a.localeCompare(b);
}

// Function to generate Table of Contents
function generateToC(directory = ".") {
    let toc = "# Table of Contents\n\n";
    let folders = {};

    function scanDir(dir) {
        fs.readdirSync(dir).forEach(file => {
            let fullPath = path.join(dir, file);
            let relativePath = path.relative(directory, fullPath).replace(/\\/g, "/");

            if (fs.statSync(fullPath).isDirectory()) {
                scanDir(fullPath);
            } else if (file.endsWith(".md") && !IGNORE_FILES.has(file)) {
                let folder = path.dirname(relativePath);
                if (!folders[folder]) folders[folder] = [];
                folders[folder].push(relativePath);

                // Add back link dynamically
                addBackLinks(fullPath, directory);
            }
        });
    }

    scanDir(directory);

    // Sort folders alphabetically
    Object.keys(folders).sort().forEach(folder => {
        if (folder !== ".") toc += `## ${folder.replace(/[-_]/g, " ")}\n\n`;

        // Sort the files in the folder numerically first, then alphabetically
        folders[folder].sort(compareFiles).forEach(file => {
            let title = path.basename(file, ".md").replace(/[-_]/g, " ").replace(/\b\w/g, c => c.toUpperCase());
            toc += `- [${title}](${encodeURL(file)})\n`;
        });

        toc += "\n";
    });

    // Write the table of contents to the output file
    fs.writeFileSync(OUTPUT_FILE, toc);
    console.log(`✅ Updated ${OUTPUT_FILE} with ${Object.keys(folders).length} sections.`);
}

// Run the script
generateToC();
