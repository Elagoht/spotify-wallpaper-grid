#!/bin/bash

# Output file
TRACKS_FILE="track_urls.txt"

# Output file
GRID_IMAGE="album_grid.png"

# Check if the track file has at least 40 unique, non-empty lines
unique_lines=$(grep -v '^\s*$' "$TRACKS_FILE" | sort | uniq)
line_count=$(echo "$unique_lines" | wc -l)
if [ "$line_count" -lt 40 ]; then
    echo "The track file contains less than 40 unique, non-empty lines. Exiting..."
    exit 1
fi

# Create a temporary directory to work in
TEMP_DIR=$(mktemp -d)

# Get the cover images of the tracks
counter=1
echo "$unique_lines" | while IFS= read -r url; do

    # Get the cover image URL from the Spotify API
    response=$(curl -s "https://open.spotify.com/oembed?url=$url")
    cover_url=$(echo $response | jq -r '.thumbnail_url')

    # Verbosely print the cover URL
    echo $counter/40: Grabbed cover image: $cover_url

    # Format counter with leading zeros
    formatted_counter=$(printf "%02d" $counter)

    # Download the cover image
    wget -q -O "$TEMP_DIR/cover_$formatted_counter.jpg" "$cover_url"

    # Verbose print the download status
    echo $counter/40: Downloaded cover image: "$TEMP_DIR/cover_$formatted_counter.jpg"
    counter=$((counter + 1))

    # Limit the number of tracks to 40
    if [ $counter -gt 40 ]; then
        break
    fi
done

# Verbose next step
echo "Creating grid image from gathered cover images..."

# Create a grid image from the cover images
montage $TEMP_DIR/cover_*.jpg -tile 8x5 -geometry +0+0 $GRID_IMAGE

# Verbose print the grid image creation status
echo "Grid image created: $GRID_IMAGE"

# Verbose print the cleanup status
echo "Cleaning up..."

# Clean up
rm -rf $TEMP_DIR

# Verbose print the completion status
echo Done!
