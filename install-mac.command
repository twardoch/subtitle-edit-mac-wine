#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

echo "INSTALLING https://github.com/SubtitleEdit/ on macOS"
echo
echo "1. Go to https://github.com/SubtitleEdit/subtitleedit/releases"
echo "2. In 'Latest release', right click the ZIP with 'Portable version' (e.g. 'SE360.zip') and copy link address"
echo "3. Paste it here and press Enter:"
read SEZIPURL

echo "Thank you, proceeding with installation..."

# Install Homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install the gcenx/wine build

brew tap gcenx/wine
brew install tesseract
brew install --cask wine-crossover
brew install winetricks

export WINEPREFIX=${HOME}/.wine-se/

# Install .NET 4.8

winetricks -q --force dotnet48
winetricks -q --force lavfilters
winetricks -q --force win10

# Install Subtitle Edit portable

curl -L -o "$dir/se.zip" "$SEZIPURL"
unzip "$dir/se.zip" -d "$WINEPREFIX/drive_c/Program Files/Subtitle Edit/"
rm "$dir/se.zip"

cp "$dir/subtitleeditw" "/usr/local/bin"

echo "Ready! Now open Terminal.app and type"
echo "subtitleeditw"
echo "to run the GUI or"
echo "subtitleeditw /help"
echo "to run the CLI"
