1.  **Project Setup & Initial File Creation:**
    *   Create `PLAN.md` with the detailed plan (this document).
    *   Create `TODO.md` with a checklist version of the plan.
    *   Create `CHANGELOG.md` to track modifications.

2.  **Analyze `install-mac.command` for Streamlining:**
    *   **Homebrew Installation:**
        *   Modify the script to check if Homebrew is already installed.
        *   If not installed, proceed with installation.
        *   If installed, inform the user and skip Homebrew installation.
    *   **Wine Version (`wine-crossover` vs. standard Wine):**
        *   For the MVP, retain the use of `gcenx/wine` and `wine-crossover` due to the assumption that it was chosen for compatibility reasons that are hard to verify without extensive testing. Add a comment in the script and `PLAN.md` noting this as a potential area for future investigation.
    *   **Tesseract Installation:**
        *   Keep Tesseract installation as it seems important for OCR features, which are core to subtitle editing.
    *   **Temporary Download Location:**
        *   Modify the script to download `se.zip` to a temporary directory (e.g., using `mktemp -d`) instead of the script's current directory.
        *   Ensure this temporary directory is cleaned up after extraction.
    *   **Error Handling & Verbosity:**
        *   Review existing commands for basic error checking (e.g., `set -e` at the beginning of the script).
        *   Add more `echo` statements to inform the user about the current stage of the installation.
    *   **Permissions for `/usr/local/bin`:**
        *   Before attempting to copy `subtitleeditw` to `/usr/local/bin`, check if the directory is writable.
        *   If not, inform the user they might need to run that specific `cp` command with `sudo` or create the path and set permissions. Provide clear instructions.
    *   **Clarity of Prompts:**
        *   Ensure the prompt for the Subtitle Edit ZIP URL is very clear.

3.  **Analyze `subtitleeditw` Script:**
    *   **Error Redirection (`2>/dev/null`):**
        *   Remove `2>/dev/null` to allow users to see potential error messages from Wine or Subtitle Edit. This is more helpful for troubleshooting.
        *   Alternatively, make verbose output an option (e.g., if a `-v` flag is passed to `subtitleeditw`), but for MVP, simply removing redirection is simpler and safer.
    *   **Integration vs. Separate File:**
        *   For MVP, keep it as a separate file copied to `/usr/local/bin` as this is user-friendly for launching the application.

4.  **Update `README.md`:**
    *   Reflect any changes made to the installation process in `install-mac.command`.
    *   Clarify the Homebrew installation step (i.e., that the script checks for it).
    *   Add a note about why `wine-crossover` is used (pending further investigation for alternatives).
    *   Ensure instructions for running the GUI and CLI versions are still accurate.
    *   Mention that error output from Wine/Subtitle Edit will now be visible if `2>/dev/null` is removed from `subtitleeditw`.

5.  **Testing (Conceptual):**
    *   Since I can't run macOS GUIs or Wine, I will mentally walk through the script logic and README instructions to ensure they are coherent and address the planned changes.
    *   Emphasis will be on script robustness (e.g., checking for existing Homebrew, handling temporary files).

6.  **Final Review and Cleanup:**
    *   Review all modified files for clarity, correctness, and completeness.
    *   Ensure `PLAN.md` and `TODO.md` are updated to reflect the final state of work.
    *   Ensure `CHANGELOG.md` lists all significant changes.

7.  **Submit Changes:**
    *   Commit all changes with a clear commit message.
    *   Use a descriptive branch name.
