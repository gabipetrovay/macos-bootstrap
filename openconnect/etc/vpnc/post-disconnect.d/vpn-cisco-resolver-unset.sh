#!/usr/bin/env bash

if [[ "${VPN_TYPE}" == "forti" ]]
then
  if [ -d /etc/resolver ]
  then
    rm -rf /etc/resolver/
  fi
fi
