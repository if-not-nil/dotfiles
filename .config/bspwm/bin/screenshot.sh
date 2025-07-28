#!/usr/bin/env bash

# Define the file path for the screenshot (adjust as needed)
screenshot_file="$HOME/Pictures/Screenshots/$(date +%s).png"

# Take a screenshot using scrot
if [ -z $* ]; then
  scrot "$screenshot_file"
else
  scrot -ps "$screenshot_file"
fi
# Check if the screenshot was taken successfully
if [ $? -eq 0 ]; then
    # Copy the screenshot to the clipboard using xclip
    xclip -selection clipboard -t image/png -i "$screenshot_file"
    notify-send "$screenshot_file"
else
    notify-send "Failed to take a screenshot."
fi
