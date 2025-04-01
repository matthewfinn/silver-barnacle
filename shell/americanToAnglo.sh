#!/bin/bash


## Running this with an arg would be like "./americanToAnglo.sh ../istqb-ctfl-2025"

# Dictionary of American to British spellings
declare -A american_to_british=(
    ["color"]="colour"
    ["favorite"]="favourite"
    ["honor"]="honour"
    ["organize"]="organise"
    ["realize"]="realise"
    ["theater"]="theatre"
    ["analyze"]="analyse"
    ["defense"]="defence"
    ["catalog"]="catalogue"
    ["traveling"]="travelling"
    ["traveled"]="travelled"
    ["aluminum"]="aluminium"
)

# Directory to scan (can accept directories as arguments)
directory_to_scan="${1:-your_directory}"  # Default to 'your_directory' if no argument

# Function to recursively scan code and markdown files in a directory
scan_files() {
  local dir="$1"

  # Loop through all files and directories in the directory, filtering by extensions
  find "$dir" -type f \( -iname "*.js" -o -iname "*.html" -o -iname "*.py" -o -iname "*.md" \) | while read -r file; do
    # Uncomment the below line to print the name of the file that's being processed
    # echo "Processing file: $file"

    # Flag to check if any replacements were made in this file
    local changes_made=false

    # Loop through each American English word and replace with British English
    for american_word in "${!american_to_british[@]}"; do
      british_word="${american_to_british[$american_word]}"

      # Use grep to check if the word exists in the file
      if grep -q "\b$american_word\b" "$file"; then
        # Replace the word in the file using sed
        sed -i "s/\b$american_word\b/$british_word/g" "$file"

        # Set flag to indicate changes were made
        changes_made=true

        # Print the word replaced
        echo "Replaced '$american_word' with '$british_word' in $file"
      fi
    done

    # Optionally print a message if changes were made
    if $changes_made; then
      echo "Replaced American English with British English in $file"
    fi
  done
}

# Start scanning the provided directory
scan_files "$directory_to_scan"
