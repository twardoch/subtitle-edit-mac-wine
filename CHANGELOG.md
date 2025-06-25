# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- `PLAN.md` for detailing the streamlining process.
- `TODO.md` for a checklist of tasks.
- `CHANGELOG.md` to track changes.

### Changed
- Modified `install-mac.command` to:
    - Check for existing Homebrew installation.
    - Use a temporary directory for downloads and ensure cleanup.
    - Add `set -e` for better error handling.
    - Improve user prompts and feedback with more `echo` statements.
    - Check for write permissions to `/usr/local/bin` and provide guidance if sudo is needed.
    - Include a comment regarding the choice of `wine-crossover`.
    - Update Homebrew installation command to the current recommended one.
    - Add PATH export for Homebrew in current session after installation.
    - Ensure WINEPREFIX directory is created.
    - Add `-o` to unzip to overwrite existing files if any.
- Modified `subtitleeditw` to:
    - Remove redirection of stderr to `/dev/null`, allowing errors to be visible.
    - Add a comment explaining the change.
- Updated `README.md` to:
    - Reflect changes in `install-mac.command` (Homebrew check, prompts, temp file handling, permissions).
    - Add a note about `wine-crossover` usage.
    - Mention that error output from `subtitleeditw` is now visible.
    - Improve overall clarity and structure of installation and usage instructions.
