#!/usr/bin/env bash

if [ -f "/usr/local/bin/tsh" ]
then
  exit
fi

curl --silent --location --output "/tmp/teleport-10.3.9.pkg" "https://cdn.teleport.dev/teleport-10.3.9.pkg"
sudo installer -package "/tmp/teleport-10.3.9.pkg" -target /Applications
