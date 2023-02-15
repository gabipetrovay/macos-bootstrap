#!/usr/bin/env bash

if [[ "${VPN_TYPE}" == "forti" ]]
then
  if [ -d ~/.vpn-forti-resolver ]
  then
    rm -rf /etc/resolver/
    cp -r ~/.vpn-forti-resolver/ /etc/resolver/
  fi

  INTERNAL_IP4_DNS=100.107.158.11

  SERVICE=$(echo "show State:/Network/Global/IPv4" | scutil | grep -F 'PrimaryService' | awk ' { print $3 }')
  SERVICE_DNS=$(echo "show State:/Network/Service/${SERVICE}/DNS" | scutil | grep -A3 "ServerAddresses" | grep '\d :' | awk '{ print $3 }' | xargs)

  if [ "${SERVICE_DNS}" != "${INTERNAL_IP4_DNS}" ]
  then
    scutil >/dev/null 2>&1 <<-EOF
      open
      get State:/Network/Service/${SERVICE}/DNS
      d.add ServerAddresses * ${INTERNAL_IP4_DNS} ${SERVICE_DNS}
      set State:/Network/Service/${SERVICE}/DNS
      close
EOF
  fi
fi

