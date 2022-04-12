#!/usr/bin/env bash

DIRNAME=`dirname "$0"`

if ! sudo security find-certificate -c "SwisscomCore" > /dev/null 2> /dev/null
then
  sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ${DIRNAME}/SwisscomCore.pem
fi

