#!/bin/bash

# Define the directory containing subfolders with JPG images
root_dir="/Users/alanms/Documents/_lzapata/zapatalibrary/_data/raw_images/lzapata"

# Find all JPG files recursively in subdirectories and loop over them
find "$root_dir" -type f -name "*.JPG" | while read -r JPG_file; do
    # Define the output file name by replacing ".JPG" extension with ".png"
    png_file="${JPG_file%.JPG}.png"

    # Convert JPG to PNG using ImageMagick's convert command
    convert "$JPG_file" "$png_file"

    # Check if conversion was successful
    if [ $? -eq 0 ]; then
        echo "Converted $JPG_file to $png_file"
    else
        echo "Failed to convert $JPG_file to $png_file"
    fi
done