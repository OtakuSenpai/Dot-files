#!/bin/bash

# The string which will store the packages..."
dataString=""

# File name of the file to read from
filename=""

function store_data() {
  while IFS= read -r line; do
    dataString="$dataString $line"
  done < "$filename"
}

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root..."
  exit
fi

echo "Enter filename: "
read filename
store_data
xbps-install -Suv $dataString
echo "Done..."

