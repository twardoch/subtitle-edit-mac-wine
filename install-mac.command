#!/usr/bin/env bash
set -e

# Get the directory of the script
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

echo "--- Subtitle Edit for macOS Installer ---"
echo

# Prompt for Subtitle Edit ZIP URL
echo "This script will guide you through installing Subtitle Edit on macOS using Wine."
echo "Please follow these steps:"
echo "1. Go to the Subtitle Edit releases page: https://github.com/SubtitleEdit/subtitleedit/releases"
echo "2. Find the 'Latest release' section."
echo "3. Right-click on the ZIP file link that includes 'Portable' in its name (e.g., SE3613_portable.zip)."
echo "4. Select 'Copy Link Address'."
echo "5. Paste the copied link here and press Enter:"
read -r SEZIPURL

if [ -z "$SEZIPURL" ]; then
  echo "No URL provided. Exiting."
  exit 1
fi

echo
echo "Thank you! Proceeding with installation..."
echo

# --- Homebrew Installation ---
echo "[Step 1/5] Checking and installing Homebrew..."
if command -v brew &>/dev/null; then
  echo "Homebrew is already installed. Skipping installation."
else
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add Homebrew to PATH for the current script execution
  # For Apple Silicon
  if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
  fi
  # For Intel Macs (usually /usr/local/bin, which should be in PATH already but good to be sure)
   if [ -d "/usr/local/bin" ]; then # Redundant on Intel but good practice
    export PATH="/usr/local/bin:$PATH"
  fi

  echo "Homebrew installation complete."
fi
echo

# --- Wine and Dependencies Installation ---
echo "[Step 2/5] Installing Wine and other dependencies (Tesseract, Winetricks)..."
# Note: This script uses gcenx/wine and wine-crossover.
# This specific version of Wine was likely chosen for compatibility.
# Future investigation could explore using standard Homebrew wine-stable or wine-devel.
brew tap gcenx/wine
echo "Installing tesseract (for OCR)..."
brew install tesseract
echo "Installing wine-crossover..."
brew install --cask wine-crossover
echo "Installing winetricks..."
brew install winetricks
echo "Wine and dependencies installation complete."
echo

# --- WINEPREFIX Setup and .NET Installation ---
echo "[Step 3/5] Setting up Wine environment and installing .NET..."
export WINEPREFIX=${HOME}/.wine-se/
mkdir -p "$WINEPREFIX" # Ensure WINEPREFIX directory exists

echo "Installing .NET 4.8 (this may take a while)..."
winetricks -q --force dotnet48
echo "Installing LAV Filters..."
winetricks -q --force lavfilters
echo "Setting Wine to Windows 10 mode..."
winetricks -q --force win10
echo ".NET and Wine configuration complete."
echo

# --- Subtitle Edit Installation ---
echo "[Step 4/5] Downloading and installing Subtitle Edit..."
TMP_DIR=$(mktemp -d)
echo "Created temporary directory: $TMP_DIR"

# Function to clean up temporary directory on exit
cleanup() {
  echo "Cleaning up temporary directory: $TMP_DIR"
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT # Register cleanup function to run on script exit (normal or error)

echo "Downloading Subtitle Edit from $SEZIPURL..."
curl -L -o "$TMP_DIR/se.zip" "$SEZIPURL"

echo "Extracting Subtitle Edit..."
# Ensure the target directory exists
mkdir -p "$WINEPREFIX/drive_c/Program Files/Subtitle Edit/"
unzip -o "$TMP_DIR/se.zip" -d "$WINEPREFIX/drive_c/Program Files/Subtitle Edit/" # Added -o to overwrite
# No need to rm "$TMP_DIR/se.zip" explicitly, as TMP_DIR will be removed by cleanup

echo "Subtitle Edit installation complete."
echo

# --- Install Wrapper Script ---
echo "[Step 5/5] Installing 'subtitleeditw' command..."
SUBTITLEEDITW_SCRIPT_SOURCE="$dir/subtitleeditw"
INSTALL_PATH="/usr/local/bin"
TARGET_SCRIPT_PATH="$INSTALL_PATH/subtitleeditw"

if [ -w "$INSTALL_PATH" ]; then
  cp "$SUBTITLEEDITW_SCRIPT_SOURCE" "$TARGET_SCRIPT_PATH"
  chmod +x "$TARGET_SCRIPT_PATH"
  echo "'subtitleeditw' command installed to $TARGET_SCRIPT_PATH."
else
  echo "Warning: Cannot write to $INSTALL_PATH."
  echo "Please copy '$SUBTITLEEDITW_SCRIPT_SOURCE' to a directory in your PATH manually,"
  echo "or run the following command with sudo:"
  echo "  sudo cp '$SUBTITLEEDITW_SCRIPT_SOURCE' '$TARGET_SCRIPT_PATH' && sudo chmod +x '$TARGET_SCRIPT_PATH'"
  echo
  echo "You can also place 'subtitleeditw' in a directory like ~/bin if it's in your PATH."
fi
echo

echo "--- Installation Finished! ---"
echo
echo "You can now try to run Subtitle Edit by opening a new Terminal window/tab and typing:"
echo "  subtitleeditw"
echo
echo "For the command-line version, type:"
echo "  subtitleeditw /help"
echo
echo "Note: The first launch of Wine and Subtitle Edit might take some time to configure."
echo "If you encounter issues, ensure all dependencies were installed correctly."
