#!/usr/bin/env bash

brew uninstall --force openconnect

rm -rf ~/.vpn-forti-resolvers
sudo rm -f /etc/sudoers.d/openconnect

sudo rm -rf /etc/vpnc/*
