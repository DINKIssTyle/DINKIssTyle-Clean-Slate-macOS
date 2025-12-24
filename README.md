# Clean Slate

Clean Slate is a pure Swift macOS utility designed to help you take clean screenshots or focus on your work by covering your desktop icons and wallpaper with a solid, customizable color.

<div align="center">
  <img src="Resources/Appicon.png" width="128" alt="Clean Slate Icon">
</div>

## Features
- **Desktop Overlay**: Covers your desktop wallpaper and icons with a solid color window.
- **Customizable Color**: Choose any background color you like.
- **Persistence**: Remembers your last used color setting.
- **Multi-Monitor Support**: Automatically covers all connected displays.
- **Menu Bar App**: Runs unobtrusively in the menu bar.

## Installation

1. Download the latest version from [GitHub Releases](../../releases).
2. Unzip the file and move `Clean Slate.app` to your `Applications` folder.

### Gatekeeper Issue ("App is damaged" or "can't be opened")
Since this app is not notarized by Apple, you may see a warning preventing it from launching. You can bypass this security check using the terminal:

1. Open **Terminal**.
2. Run the following command (assuming the app is in your Applications folder):
   ```bash
   xattr -cr /Applications/Clean\ Slate.app
   ```
3. Launch the app again.

## Usage
1. Launch **Clean Slate**. A button will appear in your menu bar (Square on Square icon).
2. Click the icon to access the menu:
    - **Toggle Show/Hide**: Immediately cover or uncover your desktop.
    - **Pick Color...**: Change the overlay color.
    - **About Clean Slate**: View app information.
    - **Quit**: Close the application.

## Requirements
- macOS 11.0 (Big Sur) or later.
- Apple Silicon or Intel Mac.

## License
(C) 2025 DINKI'ssTyle
