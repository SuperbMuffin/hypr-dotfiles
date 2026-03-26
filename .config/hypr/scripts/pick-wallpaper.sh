#!/usr/bin/env bash

WALL_DIR="$HOME/Wallpapers"

# Find all image files (follow symlinks)
mapfile -t wallpapers < <(find -L "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.bmp" \) -print | sort)

# Exit if none found
[ ${#wallpapers[@]} -eq 0 ] && { echo "No wallpapers found in $WALL_DIR"; exit 1; }

# Strip extensions for display
mapfile -t display < <(for f in "${wallpapers[@]}"; do basename "$f" | sed 's/\.[^.]*$//'; done)

# Show TUI menu using fzf (older versions, no --no-query)
selected=$(printf '%s\n' "${display[@]}" | fzf --no-sort --ansi --height 20 --reverse --inline-info --prompt="Select wallpaper: ")

# Exit if nothing selected
[ -z "$selected" ] && exit 0

# Map selection back to full path and apply
for wp in "${wallpapers[@]}"; do
    name=$(basename "$wp" | sed 's/\.[^.]*$//')
    if [[ "$name" == "$selected" ]]; then
        swww img "$wp" --transition-type grow --transition-duration 2.3 --transition-fps 165
        break
    fi
done
