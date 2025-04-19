#!/bin/sh

# Check if gedit is installed
if ! command -v gedit &> /dev/null; then
    echo "gedit is not installed. Exiting."
    exit 1
fi

# Get Gedit version
version_string=$(gedit --version 2>&1)
version=$(echo "$version_string" | grep -oP '\d+\.\d+')

# Optional: print detected version
echo "Detected gedit version: $version"

# Extract major version for logic branching
major_version=$(echo "$version" | cut -d. -f1)

if (( major_version >= 47 )); then
    echo "Installing themes for Gedit 47+"
    mkdir -p ~/.local/share/libgedit-gtksourceview-300/styles
    cp themes/catppuccin-frappe.xml ~/.local/share/libgedit-gtksourceview-300/styles
    cp themes/catppuccin-latte.xml ~/.local/share/libgedit-gtksourceview-300/styles
    cp themes/catppuccin-macchiato.xml ~/.local/share/libgedit-gtksourceview-300/styles
    cp themes/catppuccin-mocha.xml ~/.local/share/libgedit-gtksourceview-300/styles
elif (( major_version == 46 )); then
    echo "Using logic for Gedit 46"
    mkdir -p ~/.local/share/gedit/styles
    cp themes/catppuccin-frappe46.xml ~/.local/share/gedit/styles
    cp themes/catppuccin-latte46.xml ~/.local/share/gedit/styles
    cp themes/catppuccin-macchiato46.xml ~/.local/share/gedit/styles
    cp themes/catppuccin-mocha46.xml ~/.local/share/gedit/styles
else
    echo "Using fallback logic for older Gedit"
    mkdir -p ~/.local/share/gedit/styles
    cp themes/catppuccin-frappe46.xml ~/.local/share/gedit/styles
    cp themes/catppuccin-latte46.xml ~/.local/share/gedit/styles
    cp themes/catppuccin-macchiato46.xml ~/.local/share/gedit/styles
    cp themes/catppuccin-mocha46.xml ~/.local/share/gedit/styles
fi
exit 0
