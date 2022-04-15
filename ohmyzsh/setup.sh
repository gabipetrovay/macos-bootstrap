#!/usr/bin/env bash

function enable_plugin {
  local PLUGIN_NAME=$1

  grep "^plugins=(.*${PLUGIN_NAME}.*)" ~/.zshrc > /dev/null
  if [ $? -eq 1 ]
  then
    echo "  Enabling Oh My Zsh plugin: ${PLUGIN_NAME} ..."
    sed -i "" "/^plugins=/ s/)/ ${PLUGIN_NAME})/" ~/.zshrc
  else
    echo "  Oh My Zsh plugin already enabled: ${PLUGIN_NAME} ..."
  fi
}

rm -rf ~/.oh-my-zsh
rm -f ~/.zshrc*
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

enable_plugin git
enable_plugin docker
enable_plugin kubectl
enable_plugin minikube
enable_plugin gh
enable_plugin golang
enable_plugin helm
