#!/usr/bin/env bash

if [[ "${VPN_TYPE}" == "cisco" ]]
then
  scutil >/dev/null 2>&1 <<-EOF
    open
    get State:/Network/Global/Proxies
    d.remove ProxyAutoConfigURLString
    d.remove ExceptionsList
    d.remove ProxyAutoConfigEnable
    set State:/Network/Global/Proxies
    close
EOF
fi
