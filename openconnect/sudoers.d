# do not prompt for sudo password when openconnect is ran with sudo
# or the /etc/resolver/ directory is changed
%admin      ALL=(ALL) NOPASSWD: \
                /opt/homebrew/bin/openconnect, \
                /usr/bin/pkill openconnect, \
                /bin/cp -r /Users/*/.vpn-forti-resolver/ /etc/resolver/, \
                /bin/rm -rf /etc/resolver/
