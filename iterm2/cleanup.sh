#!/usr/bin/env bash

brew uninstall --force iterm2

rm -rf ~/Library/Application\ Support/iTerm2/DynamicProfiles/itermprofiles.json
rm -f ~/Library/Preferences/com.googlecode.iterm2.plist
