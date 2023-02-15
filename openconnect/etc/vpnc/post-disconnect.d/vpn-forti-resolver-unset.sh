#!/usr/bin/env bash

if [[ "${VPN_TYPE}" == "forti" ]]
then
  if [ -d /etc/resolver ]
  then
    rm -rf /etc/resolver/
  fi

  INTERNAL_IP4_DNS=100.107.158.11

  SERVICE=$(echo "show State:/Network/Global/IPv4" | scutil | grep -F 'PrimaryService' | awk ' { print $3 }')
  FIRST_SERVICE_DNS=$(echo "show State:/Network/Service/${SERVICE}/DNS" | scutil | grep -A1 "ServerAddresses" | grep '\d :' | awk '{ print $3 }')

  if [ "${FIRST_SERVICE_DNS}" == "${INTERNAL_IP4_DNS}" ]
  then
    SERVICE_DNS=$(echo "show State:/Network/Service/${SERVICE}/DNS" | scutil | grep -A3 "ServerAddresses" | grep '\d :' | awk '{ print $3 }' | xargs | cut -d ' ' -f 2-)
    scutil >/dev/null 2>&1 <<-EOF
      open
      get State:/Network/Service/${SERVICE}/DNS
      d.add ServerAddresses * ${SERVICE_DNS}
      set State:/Network/Service/${SERVICE}/DNS
      close
EOF
  fi
fi
