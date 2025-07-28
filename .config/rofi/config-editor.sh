#!/usr/bin/env bash

# Define a list of files to open
file_list=(
    "~/.config/bspwm/bspwmrc"
    "~/.config/sxhkd/sxhkdrc"
    "/etc/nixos/configuration.nix"
    "~/.config/rofi/config-editor.sh"
    "~/.config/polybar/config.ini"
    # Add more file paths as needed
)

# Use Rofi to display the list of predefined files and allow the user to select one.
selected_file=$(printf "%s\n" "${file_list[@]}" | rofi -dmenu -p "Select a file:")

# Check if the user selected a file.
if [ -n "$selected_file" ]; then
    # Open the selected file in "kitty -e micro."
    kitty -e micro "$selected_file"
fi
