#!/usr/bin/env bash

DIRNAME=`dirname "$0"`

mkdir -p ~/Library/Application\ Support/iTerm2/DynamicProfiles
cp "${DIRNAME}/profiles.json" ~/Library/Application\ Support/iTerm2/DynamicProfiles/profiles.json
