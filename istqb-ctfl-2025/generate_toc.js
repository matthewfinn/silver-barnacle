const fs = require("fs");
const path = require("path");

const OUTPUT_FILE = "home.md"; // The name of the output file
const IGNORE_FILES = new Set([OUTPUT_FILE, "README.md"]); // Files to be ignored

// Get the path of the target directory when the script is executed from outside 'istqb-ctfl-2025'
const directory = path.basename(process.cwd()).toLowerCase() === "istqb-ctfl-2025"
        ? process.cwd() : "istqb-ctfl-2025"; // Using relative path to 'istqb-ctfl-2025' if thats NOT the CWD

// Function to encode URLs safely (for spaces and special characters)
function encodeURL(filePath) {
    return encodeURIComponent(filePath).replace(/%2F/g, "/"); // Correct encoding of file paths
}

// Function to generate the relative path for the "Home" link
function getRelativePath(file, baseDir = directory) {
    let filePath = path.relative(baseDir, file).replace(/\\/g, "/");
    return filePath === "" ? `./${OUTPUT_FILE}` : `../`.repeat(filePath.split("/").length - 1) + OUTPUT_FILE;
}

// Function to insert the "Home" link at the top of Markdown files
function addBackLinks(file, baseDir = directory) {
    let content = fs.readFileSync(file, "utf-8");
    const firstLine = content.split("\n")[0].trim();
    if (firstLine !== `[🔙 Home](${getRelativePath(file, baseDir)})`) {
        content = content.replace(/^\[🔙 Home\]\(.*\)\s*\n?/, ""); // Remove existing links
        content = `[🔙 Home](${getRelativePath(file, baseDir)})\n\n` + content;
        fs.writeFileSync(file, content); // Write updated content
    }
}

// Function to extract numeric prefixes from file names for sorting
function extractNumericPrefix(fileName) {
    const match = fileName.match(/^(\d+)/); // Match leading digits
    return match ? parseInt(match[1], 10) : Infinity;
}

// Function to compare files based on numeric prefixes and alphabetically
function compareFiles(a, b) {
    const numA = extractNumericPrefix(path.basename(a));
    const numB = extractNumericPrefix(path.basename(b));
    return numA !== numB ? numA - numB : a.localeCompare(b);
}

// Function to scan a directory and categorize files into folders
function scanDir(dir, folders, resourcesFiles, baseDir) {
    fs.readdirSync(dir).forEach(file => {
        let fullPath = path.join(dir, file);
        let relativePath = path.relative(baseDir, fullPath).replace(/\\/g, "/");

        if (file === ".idea" || file === "assets") return; // Skip unwanted folders
        if (fs.statSync(fullPath).isDirectory()) {
            // Skip "resources/attempts" subdirectory
            if (relativePath.toLowerCase() === "resources/attempts") {
                return;
            }
            scanDir(fullPath, folders, resourcesFiles, baseDir); // Recurse into subdirectories
        } else if (file.endsWith(".md") && !IGNORE_FILES.has(file)) {
            let folder = path.dirname(relativePath);
            if (folder.toLowerCase() === "resources") {
                resourcesFiles.push(relativePath); // Collect "resources" files
            } else {
                folders[folder] = folders[folder] || [];
                folders[folder].push(relativePath);
            }
            addBackLinks(fullPath, baseDir); // Add "Home" link to the file
        } else if (file.endsWith(".pdf")) {
            let folder = path.dirname(relativePath).toLowerCase();
            if (!folder.includes("resources")) {
                folders[folder] = folders[folder] || [];
                folders[folder].push(relativePath); // Add PDF files to the correct folder
            }
        }
    });
}

// Main function to generate the Table of Contents
function generateToC() {
    let toc = "# Table of Contents\n\n"; // Initialize TOC
    let folders = {}; // Store folders and files
    let resourcesFiles = []; // Store resources files separately

    // Scan the directory
    scanDir(directory, folders, resourcesFiles, directory);

    // Sort folders and add them to TOC
    Object.keys(folders).sort(customSort).forEach(folder => {
        if (folder !== ".") toc += `## ${folder.replace(/[-_]/g, " ")}\n\n`;
        folders[folder].sort(compareFiles).forEach(file => {
            let title = path.basename(file, ".md").replace(/[-_]/g, " ").replace(/\b\w/g, c => c.toUpperCase());
            toc += `- [${title}](${encodeURL(file)})\n`;
        });
        toc += "\n";
    });

    // Add the "Resources" section (files inside resources folder)
    if (resourcesFiles.length > 0) {
        toc += "## Resources\n\n";
        resourcesFiles.sort(compareFiles).forEach(file => {
            let title = path.basename(file, ".md").replace(/[-_]/g, " ").replace(/\b\w/g, c => c.toUpperCase());
            toc += `- [${title}](${encodeURL(file)})\n`;
        });
        toc += "\n";
    }

    // Write the TOC to the output file inside the target directory
    const outputPath = path.join(directory, OUTPUT_FILE); // Ensure the output file is within the target directory
    fs.writeFileSync(outputPath, toc);
    console.log(`✅ Updated ${OUTPUT_FILE} inside ${directory} with ${Object.keys(folders).length} sections.`);
}

// Sorting function to keep "resources" section last
function customSort(a, b) {
    if (a.toLowerCase().startsWith("resources")) return 1; // Move "resources" to the end
    if (b.toLowerCase().startsWith("resources")) return -1;
    return a.localeCompare(b, undefined, { numeric: true });
}

// Run the script to generate the TOC
generateToC();
