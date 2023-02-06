#!/usr/bin/env bash

if [[ "${VPN_TYPE}" == "forti" ]]
then
  if [ -d ~/.vpn-forti-resolver ]
  then
    rm -rf /etc/resolver/
    cp -r ~/.vpn-forti-resolver/ /etc/resolver/
  fi
fi
