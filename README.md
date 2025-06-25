# Subtitle Edit on macOS using Wine

This project provides a script to install and run [Subtitle Edit](https://github.com/SubtitleEdit/subtitleedit/) on macOS (tested on 10.12 and later, but may work on other versions) using Wine.

![](./subtitle-edit.png)

## Installation

1.  **Download this Repository:**
    *   Download the [latest release of this project](https://github.com/twardoch/subtitle-edit-mac-wine/archive/refs/heads/main.zip) and unzip it.
    *   Alternatively, clone this repository.

2.  **Run the Installation Script:**
    *   Open Terminal.app, navigate to the directory where you unzipped/cloned this project.
    *   Make the script executable: `chmod +x install-mac.command`
    *   Run the script: `./install-mac.command`
        *   If you encounter issues running it directly, you might need to Ctrl+click `install-mac.command` in Finder and choose _Open_, then confirm.

3.  **Follow On-Screen Prompts:**
    *   The script will ask you to provide a download link for the **portable version** of Subtitle Edit:
        1.  Go to the [Subtitle Edit releases page](https://github.com/SubtitleEdit/subtitleedit/releases).
        2.  In the "Latest release" section (or your preferred version), find the ZIP file for the **Portable version** (e.g., `SE_4_0_6_portable.zip`).
        3.  Right-click on this ZIP file link and choose "Copy Link".
        4.  Paste this link into the Terminal when prompted by the script and press Enter.
    *   The script will then proceed to:
        *   Check for Homebrew. If not installed, it will install it.
        *   Install Wine (using `gcenx/wine` for `wine-crossover`), Tesseract (for OCR), and Winetricks.
        *   Set up a Wine environment (`~/.wine-se/`).
        *   Install .NET 4.8 and LAV Filters into the Wine environment.
        *   Download and install Subtitle Edit to the Wine environment.
        *   Copy the `subtitleeditw` wrapper script to `/usr/local/bin`. If this location is not writable, it will provide instructions for manual installation or using `sudo`.

4.  **Post-Installation:**
    *   The script will clean up temporary files. You can remove the downloaded ZIP of this repository and the unzipped/cloned folder if you wish, once the installation is successful and `subtitleeditw` is in your PATH.

**Note on Wine Version:** This script uses `wine-crossover` from the `gcenx/wine` Homebrew tap. This specific version was likely chosen for better compatibility with Subtitle Edit at the time of the script's creation. Future updates might explore using more standard Wine versions available directly from Homebrew's core tap.

## Running Subtitle Edit

### GUI Application

Open a **new** Terminal window/tab (this ensures `/usr/local/bin` is in the PATH if it was just updated) and type:

```bash
subtitleeditw
```

This will launch the GUI version of Subtitle Edit.

**Troubleshooting GUI:**
*   **Video Playback:** If you open a video and cannot see it playing, try selecting _Video > Undock video controls_ in Subtitle Edit.
*   **Error Messages:** The `subtitleeditw` script no longer suppresses error messages from Wine or Subtitle Edit. If you encounter issues, these messages might provide clues.

### Command-Line Interface (CLI)

Open Terminal.app and type:

```bash
subtitleeditw /help
```

This will display the help information for the CLI version of Subtitle Edit.

#### CLI Example

Convert all `.srt` subtitles in `INFOLDER` to `.srt` in `OUTFOLDER` and perform some common fixes (replace the `.` in `INFOLDER=` and `OUTFOLDER=` with actual folder paths):

```bash
INFOLDER=. && \
OUTFOLDER=. && \
mkdir -p "$OUTFOLDER" && \
subtitleeditw /convert '*.srt' subrip \
  /inputfolder:"$INFOLDER" \
  /outputfolder:"$OUTFOLDER" \
  /overwrite \
  /FixCommonErrors \
  /MergeSameTimeCodes \
  /MergeSameTexts \
  /MergeShortLines \
  /RedoCasing
```

**Note:** Use single quotes to surround `'*.srt'` in the command.

## Credits

-   Shell scripts originally by Adam Twardoch, with modifications by the community.
-   This project provides a convenient way to use Subtitle Edit on macOS; Subtitle Edit itself is developed by Nikolaj Lynge Olsson and other contributors.
-   The scripts in this repository are provided under [The Unlicense](./LICENSE).
-   Subtitle Edit is licensed under GPL-3.0.
