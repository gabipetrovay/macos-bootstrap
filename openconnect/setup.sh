#!/usr/bin/env bash

DIRNAME=`dirname "$0"`

sed "s/user=.*/user=${VPN_USERNAME}@swisscom.ras/" "${DIRNAME}/vpn-cisco" > ~/.vpn-cisco
sed "s/user=.*/user=${VPN_USERNAME}/" "${DIRNAME}/vpn-forti" > ~/.vpn-forti

sudo mkdir -p /etc/vpnc/post-connect.d
sudo cp "${DIRNAME}/vpn-cisco-proxy-set.sh" /etc/vpnc/post-connect.d/
sudo mkdir -p /etc/vpnc/post-disconnect.d
sudo cp "${DIRNAME}/vpn-cisco-proxy-unset.sh" /etc/vpnc/post-disconnect.d/

if [ "`grep "openconnect utility functions" ~/.zprofile`" == "" ]
then
  echo "" >> ~/.zprofile
  echo "# openconnect utility functions" >> ~/.zprofile
  echo "RSA_PIN='${RSA_PIN}'" >> ~/.zprofile
  echo "FORTI_PASSWORD='${FORTI_PASSWORD}'" >> ~/.zprofile
  echo "" >> ~/.zprofile
  cat "${DIRNAME}/zprofile" >> ~/.zprofile
fi
