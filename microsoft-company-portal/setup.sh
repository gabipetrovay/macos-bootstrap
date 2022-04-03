#!/usr/bin/env bash

curl --silent --location --output /tmp/CompanyPortal-Installer.pkg https://go.microsoft.com/fwlink/?linkid=862280
sudo installer -package /tmp/CompanyPortal-Installer.pkg -target /Applications

echo "  📕 Follow the intructions on the following pages to complete the MacBook registration:"
echo "    https://wiki.swisscom.com/display/DOST/3.03+Register+MacBook"
echo "    https://swisscom.sharepoint.com/sites/worksmartnowcommunity/SitePages/de_anleitung_registrierung_unmanaged_mac.aspx"
