#!/usr/bin/env bash

echo '' >> ~/.zprofile
echo '# kubectx aliases' >> ~/.zprofile
echo 'alias kx=kubectx' >> ~/.zprofile
echo 'alias kns=kubens # not using kn as this is the knative CLI' >> ~/.zprofile
echo '# kubectx completion' >> ~/.zprofile
echo 'fpath=($(dirname $(dirname $(which kubectx))/$(readlink $(which kubectx)))/../share/zsh/site-functions $fpath)' >> ~/.zprofile
