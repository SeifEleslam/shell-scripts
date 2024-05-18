#!/bin/bash

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

# URL from the argument
url="$1"

# Generate a unique filename for the temporary HTML file
tmp_file=$(mktemp --suffix=.html)

# Fetch the HTML content using curl and redirect to the temporary file
curl -s "$url" > "$tmp_file"

# Check if the download was successful
if [ $? -eq 0 ]; then
  # Open the temporary file in the default web browser
  xdg-open "$tmp_file" &

  # Wait for the user to (presumably) close the browser window
  wait

  # Delete the temporary file
#   rm "$tmp_file"
else
  echo "Error: Failed to download the URL."
fi