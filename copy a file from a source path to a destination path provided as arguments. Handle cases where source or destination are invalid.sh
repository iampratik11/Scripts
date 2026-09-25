#!/bin/bash

# Check if exactly two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_file> <destination_path>"
    exit 1
fi

source=$1
destination=$2

# Check if the source file exists
if [ ! -e "$source" ]; then
    echo "Error: Source file does not exist."
    exit 1
fi

# Check if the source is a regular file
if [ ! -f "$source" ]; then
    echo "Error: Source is not a regular file."
    exit 1
fi

# Check if the destination directory exists
dest_dir=$(dirname "$destination")

if [ ! -d "$dest_dir" ]; then
    echo "Error: Destination directory does not exist."
    exit 1
fi

# Copy the file
cp "$source" "$destination"

# Check if the copy was successful
if [ $? -eq 0 ]; then
    echo "File copied successfully."
else
    echo "Error: Failed to copy the file."
fi
