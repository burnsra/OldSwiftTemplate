# SwiftTemplate

## Overview

**SwiftTemplate** is a template OS X application, written in Swift. This template application provides the following features:

- Status bar icon
- Available menu items:
 - About window
 - Documentation link
 - Preferences window
 - Quit
- Available preferences:
 - Start at login

## Screenshots

Status Menu

<img style="max-width:100%;" src="https://github.com/burnsra/SwiftTemplate/blob/master/assets/status_menu.png" />

Preferences Window

<img style="max-width:100%;" src="https://github.com/burnsra/SwiftTemplate/blob/master/assets/preferences_window.png" />

## Installation

After you install homebrew-cask, run the following command:

```sh
$ brew tap burnsra/personal
```

You can now install the swifttemplate cask.

```sh
$ brew cask install swifttemplate
```

[Direct Downloads](https://github.com/burnsra/SwiftTemplate/releases)

## Requirements

- OS X 10.10

## Building

```sh
$ git clone https://github.com/burnsra/SwiftTemplate.git
$ cd SwiftTemplate
$ xcodebuild clean build test archive -project SwiftTemplate.xcodeproj -scheme SwiftTemplate
```

Build should be at available at the following (date/time stamps change):

```sh
~/Library/Developer/Xcode/Archives/2016-04-02]/SwiftTemplate 4-02-16, 10.15 AM.xcarchive/Products
```

## Configuration

- Available Preferences
 - Launch at login

## Contributions

Do you want to improve the app or add any useful features? Please go ahead and create pull requests. I'm thankful for any help.

## License

[MIT](https://github.com/burnsra/swifttemplate/blob/master/LICENSE) © Robert Burns
