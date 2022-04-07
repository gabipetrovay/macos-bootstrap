#!/usr/bin/env bash

DIRNAME=`dirname "$0"`

sed "s/user=.*/user=${CORPROOT_USER_NAME}@swisscom.ras/" "${DIRNAME}/vpn-cisco" > ~/.vpn-cisco
sed "s/user=.*/user=${CORPROOT_USER_NAME}/" "${DIRNAME}/vpn-forti" > ~/.vpn-forti

if [ "`grep "openconnect utility functions" ~/.zprofile`" == "" ]
then
  echo "" >> ~/.zprofile
  echo "# openconnect utility functions" >> ~/.zprofile
  echo "RSA_PIN=${RSA_PIN}" >> ~/.zprofile
  echo "FORTI_PASSWORD=${CORPROOT_PASSWORD}" >> ~/.zprofile
  echo "" >> ~/.zprofile
  cat "${DIRNAME}/zprofile" >> ~/.zprofile
fi
