#! /usr/bin/bash -x
fileContents="$1"
headerFooterSpec="$2"
resultingFile="$3"

cat "${headerFooterSpec}_header.html" "$fileContents" "${headerFooterSpec}_footer.html" > "$resultingFile"