#!/usr/bin/env bash

curl --silent --location --output /tmp/CompanyPortal-Installer.pkg https://go.microsoft.com/fwlink/?linkid=862280
sudo installer -package /tmp/CompanyPortal-Installer.pkg -target /Applications
