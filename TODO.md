- [x] **Project Setup & Initial File Creation:**
    - [x] Create `PLAN.md` with the detailed plan.
    - [x] Create `TODO.md` with a checklist version of the plan.
    - [x] Create `CHANGELOG.md` to track modifications.

- [x] **Analyze `install-mac.command` for Streamlining:**
    - [x] **Homebrew Installation:**
        - [x] Modify the script to check if Homebrew is already installed.
        - [x] If not installed, proceed with installation.
        - [x] If installed, inform the user and skip Homebrew installation.
    - [x] **Wine Version (`wine-crossover` vs. standard Wine):**
        - [x] For the MVP, retain the use of `gcenx/wine` and `wine-crossover`.
        - [x] Add a comment in the script and `PLAN.md` noting this as a potential area for future investigation.
    - [x] **Tesseract Installation:**
        - [x] Keep Tesseract installation.
    - [x] **Temporary Download Location:**
        - [x] Modify script to download `se.zip` to a temporary directory.
        - [x] Ensure temporary directory is cleaned up.
    - [x] **Error Handling & Verbosity:**
        - [x] Add `set -e` to the script.
        - [x] Add more `echo` statements for user feedback.
    - [x] **Permissions for `/usr/local/bin`:**
        - [x] Check if `/usr/local/bin` is writable.
        - [x] Provide instructions if `sudo` is needed for `cp`.
    - [x] **Clarity of Prompts:**
        - [x] Ensure Subtitle Edit ZIP URL prompt is clear.

- [x] **Analyze `subtitleeditw` Script:**
    - [x] **Error Redirection (`2>/dev/null`):**
        - [x] Remove `2>/dev/null`.
    - [x] **Integration vs. Separate File:**
        - [x] Keep as a separate file.

- [x] **Update `README.md`:**
    - [x] Reflect changes in `install-mac.command`.
    - [x] Clarify Homebrew installation check.
    - [x] Add note about `wine-crossover`.
    - [x] Ensure GUI/CLI instructions are accurate.
    - [x] Mention visibility of error output.

- [x] **Testing (Conceptual):**
    - [x] Mentally walk through script logic and README.

- [x] **Final Review and Cleanup:**
    - [x] Review all modified files.
    - [x] Update `PLAN.md` and `TODO.md`.
    - [x] Update `CHANGELOG.md`.

- [ ] **Submit Changes:**
    - [ ] Commit changes with a clear message.
    - [ ] Use a descriptive branch name.
