#!/usr/bin/env bash

echo '' >> ~/.zprofile
echo '# kubectx alias' >> ~/.zprofile
echo 'alias kx=kubectx' >> ~/.zprofile
echo '# kubectx completion' >> ~/.zprofile
echo 'fpath=($(dirname $(dirname $(which kubectx))/$(readlink $(which kubectx)))/../share/zsh/site-functions $fpath)' >> ~/.zprofile
