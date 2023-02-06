# do not prompt for sudo password when openconnect is ran with sudo
# and allow the user to set environment variables when running openconnect
%admin      ALL=(ALL) NOPASSWD:SETENV: /opt/homebrew/bin/openconnect

# do not prompt for sudo password when other openconnect-related commands are ran
%admin      ALL=(ALL) NOPASSWD: \
                /usr/bin/pkill openconnect, \
                /bin/cp -r /Users/*/.vpn-forti-resolver/ /etc/resolver/, \
                /bin/rm -rf /etc/resolver/
