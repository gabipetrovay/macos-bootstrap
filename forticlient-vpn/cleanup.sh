#!/usr/bin/env bash

brew uninstall --force forticlient-vpn

rm -f ~/Library/Preferences/com.fortinet.FortiClient.*
rm -rf ~/Library/Application\ Support/Fortinet/
rm -rf ~/Library/Application\ Support/FortiClient/
