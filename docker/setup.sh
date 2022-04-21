#!/usr/bin/env bash

echo "  ⚠️a Check if you require a Docker Desktop license!"

curl --silent --location --output /tmp/Docker.dmg "https://desktop.docker.com/mac/main/arm64/Docker.dmg"
hdiutil attach -noverify /tmp/Docker.dmg > /dev/null
sudo cp -r /Volumes/Docker/Docker.app /Applications
hdiutil detach /Volumes/Docker > /dev/null
