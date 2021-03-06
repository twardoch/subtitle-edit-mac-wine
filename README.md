# subtitle-edit-mac-wine

Way to use [Subtitle Edit](https://github.com/SubtitleEdit/subtitleedit/) on macOS 10.12—11.

![](./subtitle-edit.png)

## Installation

1. Download and unzip [this repository](https://github.com/twardoch/subtitle-edit-mac-wine/archive/refs/heads/main.zip)
2. Ctrl+click `install-mac.command` and choose _Open_. If asked for confirmation, choose _Open_.
3. When asked, go to the [Subtitle Edit releases page](https://github.com/SubtitleEdit/subtitleedit/releases)
4. In the _Latest releases_ section, right click the ZIP for the Portable version, for example [`SE360.zip`](https://github.com/SubtitleEdit/subtitleedit/releases/download/3.6.0/SE360.zip) and copy the link
5. Paste the link to Terminal and press Enter.
6. Wait until the installation of Homebrew, Wine, winetricks and .NET is completed.
7. Remove the downloaded ZIP and the unzipped folder.

## Running GUI app

Open Terminal.app and type:

```
subtitleeditw
```

to run the GUI version of Subtitle Edit. _Note: Use _Video > Undock video controls_ if you cannot see the video playing after you open it.


## Using in command-line

Open Terminal.app and type:

```
subtitleeditw /help
```

to run the CLI version of Subtitle Edit.

### Example

Convert all .srt subtitles in INFOLDER into .srt in the OUTFOLDER and perform some fixes (replace the `.` in `INFOLDER=` and `OUTFOLDER=` with actual folder paths).

```
INFOLDER=. && OUTFOLDER=. && mkdir -p "$OUTFOLDER" && subtitleeditw /convert '*.srt' subrip /inputfolder:"$INFOLDER" /outputfolder:"$OUTFOLDER" /overwrite /FixCommonErrors /MergeSameTimeCodes /MergeSameTexts /MergeShortLines /RedoCasing;
```

_Note: Use single quotes to surround `'*.srt'`_


## Credits

- Shell scripts written by Adam Twardoch
- Only tested on my machine, no guarantee
- [The Unlicense](./LICENSE)
- Subtitle Edit is made by Nikolaj Lynge Olsson
