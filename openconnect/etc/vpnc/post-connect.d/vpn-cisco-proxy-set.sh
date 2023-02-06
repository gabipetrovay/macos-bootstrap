#!/usr/bin/env bash

if [[ "${VPN_TYPE}" == "cisco" ]]
then
  CISCO_PROXY_CONFIG_URL="http://aproxy.corproot.net/proxy.pac"
  CISCO_PROXY_EXCEPTION_LIST="sg0017*.corproot.net sg0016*.corproot.net lyncpool*.swisscom.com 127.0.0.1 vidia.swisscom.ch vpre.swisscom.ch *.pv.swisscom.ch api.scapp-console.swisscom.com"

  scutil >/dev/null 2>&1 <<-EOF
    open
    get State:/Network/Global/Proxies
    d.add ProxyAutoConfigURLString ${CISCO_PROXY_CONFIG_URL}
    d.add ExceptionsList ${CISCO_PROXY_EXCEPTION_LIST}
    d.add ProxyAutoConfigEnable # 1
    set State:/Network/Global/Proxies
    close
EOF
fi
