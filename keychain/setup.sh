#!/usr/bin/env bash

DIRNAME=`dirname "$0"`

function add_root_certificate {
  local CNAME=$1

  if ! sudo security find-certificate -c "${CNAME}" > /dev/null 2> /dev/null
  then
    sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain "${DIRNAME}/${CNAME}.pem"
  fi
}

add_root_certificate "SwisscomCore"
add_root_certificate "SwisscomRootCore"
