#!/usr/bin/env bash

grep "alias ll=" ~/.zprofile > /dev/null
if [ $? -eq 1 ]
then
  echo '' >> ~/.zprofile
  echo '# generic aliases' >> ~/.zprofile
  echo 'alias ll="ls -al --color"' >> ~/.zprofile
  echo 'alias grep="grep --color"' >> ~/.zprofile
fi
