#!/usr/bin/env bash

if [ "${VIM_PACK_DIR}" == "" ]
then
  VIM_PACK_DIR=plugins
  echo "  ⚠️  WARNING: no VIM_PACK_DIR was provided. Using the default value: ${VIM_PACK_DIR}"
fi

function install_plugin {
  local PLUGIN_NAME=$1
  local PLUGIN_GIT_REPO=$2

  echo "  Installing Vim plugin: ${PLUGIN_NAME} ..."

  # for repeated script runs or for upgrades we first remove each plugin
  rm -rf ~/".vim/pack/${VIM_PACK_DIR}/start/${PLUGIN_NAME}"
  git clone --quiet --depth 1 "${PLUGIN_GIT_REPO}" ~/".vim/pack/${VIM_PACK_DIR}/start/${PLUGIN_NAME}"
}

DIRNAME=`dirname "$0"`

cp "${DIRNAME}/vimrc" ~/.vimrc

mkdir -p ~/".vim/pack/${VIM_PACK_DIR}/start"

install_plugin ctrlp https://github.com/ctrlpvim/ctrlp.vim.git
install_plugin ale https://github.com/dense-analysis/ale.git
install_plugin fugitive https://github.com/tpope/vim-fugitive.git
install_plugin vim-terraform https://github.com/hashivim/vim-terraform.git

