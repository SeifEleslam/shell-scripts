#!/bin/bash

# Define the directory to clean
tmp_dir="/tmp"

# Loop through files in the directory
for file in "$tmp_dir"/*.html; do
  # Check if it's actually a file (avoid hidden files etc.)
  if [[ -f "$file" ]]; then
    # Remove the file
    rm -f "$file"
    echo "Deleted temporary HTML file: $file"
  fi
done

echo "Cleaning of temporary HTML files in $tmp_dir completed."
