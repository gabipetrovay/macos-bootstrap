#!/usr/bin/env bash

scutil >/dev/null 2>&1 <<-EOF
  open
  get State:/Network/Global/Proxies
  d.add ProxyAutoConfigURLString ${CISCO_PROXY_CONFIG_URL}
  d.add ExceptionsList ${CISCO_PROXY_EXCEPTION_LIST}
  d.add ProxyAutoConfigEnable # 1
  set State:/Network/Global/Proxies
  close
EOF

