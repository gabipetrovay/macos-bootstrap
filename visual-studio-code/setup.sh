#!/usr/bin/env bash

function install_extension {
  local EXTENSION_NAME=$1

  echo "  Installing VS Code extension: ${EXTENSION_NAME} ..."
  code --force --install-extension "${EXTENSION_NAME}"
}

install_extension golang.go
