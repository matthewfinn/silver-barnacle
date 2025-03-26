const fs = require("fs");
const path = require("path");

const OUTPUT_FILE = "home.md";
const IGNORE_FILES = new Set([OUTPUT_FILE, "README.md"]);

// Function to safely encode URLs (Handle spaces & special characters in filenames)
function encodeURL(filePath) {
    return encodeURIComponent(filePath).replace(/%2F/g, "/");
}

// Function to compute relative path to `index.md`
function getRelativePath(file, baseDir = ".") {
    let filePath = path.relative(baseDir, file).replace(/\\/g, "/"); // Correct the relative path
    if (filePath === "") {
        return "./" + OUTPUT_FILE;  // If it's in the base folder
    }
    // Replace subfolder path with necessary `../` to navigate back to home.md
    return "../".repeat(filePath.split("/").length - 1) + OUTPUT_FILE;
}

// Function to add or update "Home" at the top of Markdown files
function addBackLinks(file, baseDir = ".") {
    let content = fs.readFileSync(file, "utf-8");

    // Check if the first non-empty line contains the "Home" link
    const firstLine = content.split("\n")[0].trim();

    // Only add or update the "Home" link if it's not already the first line
    if (firstLine !== `[🔙 Home](${getRelativePath(file, baseDir)})`) {
        // Remove any existing back links (even with extra whitespace)
        content = content.replace(/^\[🔙 Home\]\(.*\)\s*\n?/, "");

        // Prepend the new back link with exactly one newline after it
        let backLink = `[🔙 Home](${getRelativePath(file, baseDir)})\n\n`;
        content = backLink + content;

        // Write the updated content back to the file
        fs.writeFileSync(file, content);
    }
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
        console.log(`🔍 Scanning directory: ${dir}`); // Debugging: Log every scanned directory

        fs.readdirSync(dir).forEach(file => {
            let fullPath = path.join(dir, file);
            let relativePath = path.relative(directory, fullPath).replace(/\\/g, "/");

            console.log(`   📂 Found: ${relativePath}`); // Debugging: Log every found file

            // Skip .idea & assets folders
            if (file === ".idea" || file === "assets") return;

            if (fs.statSync(fullPath).isDirectory()) {
                scanDir(fullPath); // Recursively scan subdirectories
            } else if (file.endsWith(".md") && !IGNORE_FILES.has(file)) {
                let folder = path.dirname(relativePath);
                if (!folders[folder]) folders[folder] = [];
                folders[folder].push(relativePath);
                addBackLinks(fullPath, directory);
            } else if (file.endsWith(".pdf")) {
                console.log(`   ✅ PDF Detected: ${relativePath}`); // Debugging: Log found PDFs
                let folder = path.dirname(relativePath);
                if (!folders[folder]) folders[folder] = [];
                folders[folder].push(relativePath);
            }
        });
    }




    scanDir(directory);

    // Sort folders alphabetically
    Object.keys(folders).sort(customSort).forEach(folder => {
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

    function customSort(a, b) {
        // Ensure "resources" is always last
        if (a.toLowerCase() === "resources") return 1;
        if (b.toLowerCase() === "resources") return -1;
        return a.localeCompare(b, undefined, { numeric: true });
    }
}

// Run the script
generateToC();
