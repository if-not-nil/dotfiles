#!/bin/bash

input_file="./con"
output_file="$2"


# If no output file is given, overwrite the input file
if [ -z "$output_file" ]; then
  output_file="$input_file"
fi

# Use sed to replace both strings
sed -e 's/Super/Alt/g' -e 's/\/Users\/test/\/home\/user/g' "$input_file" > "$output_file"

echo "Replacements done. Output saved to: $output_file"
