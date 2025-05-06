const fs = require('fs');
const path = require('path');

/**
 * Extracts a numeric value from the filename for proper sorting.
 * Example: '04 - Intro.md' => 4
 */
function getNumericKey(filename) {
    const match = filename.match(/\d+/);
    return match ? parseInt(match[0], 10) : Infinity;
}

/**
 * Sorts an array of markdown filenames based on numeric order.
 */
function sortMarkdownFiles(files) {
    return files
        .filter(f => f.endsWith('.md'))
        .sort((a, b) => getNumericKey(a) - getNumericKey(b));
}

/**
 * Generates a map of each file to its previous and next file.
 */
function generateLinks(files) {
    const links = {};
    for (let i = 0; i < files.length; i++) {
        const prev = i > 0 ? files[i - 1] : null;
        const next = i < files.length - 1 ? files[i + 1] : null;
        links[files[i]] = { prev, next };
    }
    return links;
}

/**
 * Adds navigation links to the top of a Markdown file.
 */
function addLinksToFile(filename, prev, next) {
    const filepath = path.join(__dirname, filename);

    // Read existing file content
    let content = fs.readFileSync(filepath, 'utf8');

    // Remove any previously inserted navigation line
    content = content.replace(/^\[.*?\]\(.*?\)(?: \| \[.*?\]\(.*?\))?\n\n/, '');

    // Encode filenames for use in Markdown URLs
    const encodedPrev = prev ? encodeURIComponent(prev) : null;
    const encodedNext = next ? encodeURIComponent(next) : null;

    // Create the nav line
    let navLine = '';
    if (prev && next) {
        navLine = `[Previous](${encodedPrev}) | [Next](${encodedNext})\n\n`;
    } else if (prev) {
        navLine = `[Previous](${encodedPrev})\n\n`;
    } else if (next) {
        navLine = `[Next](${encodedNext})\n\n`;
    }

    // Write updated content back to the file
    fs.writeFileSync(filepath, navLine + content, 'utf8');
}

/**
 * Main function to process markdown files in the current directory.
 */
function main() {
    const files = sortMarkdownFiles(fs.readdirSync('.'));
    const links = generateLinks(files);

    for (const file of files) {
        const { prev, next } = links[file];
        addLinksToFile(file, prev, next);
    }

    console.log('Navigation links updated.');
}

main();
