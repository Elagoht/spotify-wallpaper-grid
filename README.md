# Spotify Album Grid Wallpaper Generator

![Shell Script](https://img.shields.io/badge/bash-automation-blue?logo=gnubash&logoColor=white)
![Issues](https://img.shields.io/github/issues/Elagoht/spotify-wallpaper-grid)
![Stars](https://img.shields.io/github/stars/Elagoht/spotify-wallpaper-grid)

This script creates a grid wallpaper of album covers from a list of Spotify track URLs.

## Features

- Fetches album covers from Spotify track URLs
- Creates a grid image of 40 album covers
- Simple and efficient

## Prerequisites

- `bash`
- `curl`
- `jq`
- `wget`
- `imagemagick`

## Usage

1. Clone the repository:

```sh
git clone https://github.com/Elagoht/spotify-wallpaper-grid.git
cd spotify-wallpaper-grid
```

2. Prepare a `track_urls.txt` file containing Spotify track URLs. Ensure the file has at least 40 unique, non-empty lines.

3. Run the script:

```sh
./generate_album_grid.sh
```

4. The resulting grid image will be saved as `album_grid.png`.

## Examples

![Album Grid Example #0](example0.png)


![Album Grid Example #1](example1.png)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Issues

If you find any issues, please open a new [issue](https://github.com/Elagoht/spotify-wallpaper-grid/issues).

## Acknowledgements

- [Spotify](https://developer.spotify.com/documentation/web-api/) for the API
- [ImageMagick](https://imagemagick.org/) for image processing