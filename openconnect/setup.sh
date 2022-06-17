#!/usr/bin/env bash

DIRNAME=`dirname "$0"`

cp -r "${DIRNAME}/resolver/" ~/.vpn-forti-resolver

sed "s/user=.*/user=${VPN_USERNAME}@swisscom.ras/" "${DIRNAME}/vpn-cisco" > ~/.vpn-cisco
sed "s/user=.*/user=${VPN_USERNAME}/" "${DIRNAME}/vpn-forti" > ~/.vpn-forti

# hooks to set/unset Mac proxy required when this VPN is connected
sudo mkdir -p /etc/vpnc/post-connect.d
sudo cp "${DIRNAME}/vpn-cisco-proxy-set.sh" /etc/vpnc/post-connect.d/
sudo mkdir -p /etc/vpnc/post-disconnect.d
sudo cp "${DIRNAME}/vpn-cisco-proxy-unset.sh" /etc/vpnc/post-disconnect.d/
# do not prompt for password when openconnect is ran or killed with sudo
sudo cp "${DIRNAME}/sudoers.d" /etc/sudoers.d/openconnect

if [ "`grep "openconnect utility functions" ~/.zprofile`" == "" ]
then
  echo "" >> ~/.zprofile
  echo "# openconnect utility functions" >> ~/.zprofile
  echo "CISCO_RSA_PIN='${CISCO_RSA_PIN}'" >> ~/.zprofile
  echo "FORTI_PASSWORD='${FORTI_PASSWORD}'" >> ~/.zprofile
  echo "" >> ~/.zprofile
  cat "${DIRNAME}/zprofile" >> ~/.zprofile
fi
