#!/usr/bin/env bash

set -e

# this runs the no-op command 'true' as super user in order to prompt for the password in the beginning
sudo true


function load_secrets {
  local COMPONENT=$1

  if [ -f ./"${COMPONENT}/secrets.sh" ]
  then
    source ./"${COMPONENT}/secrets.sh"
    echo "  🔐 Loaded secrets for ${COMPONENT}"
  fi
}


function brew_install {
  local FORMULA=$1
  local INSTALL_GUARD_PATH=$2
  local NAME=$3

  if [ "$2" == "" ]
  then
    INSTALL_GUARD_PATH=/opt/homebrew/bin/${FORMULA}
  fi

  if [ "$3" == "" ]
  then
    NAME=${FORMULA}
  fi

  echo "📦 Installing ${NAME} (brew) ..."
  
  if [ -f "${INSTALL_GUARD_PATH}" ]
  then
    echo "  🆗 ${NAME} already installed"
    return
  fi

  # load secrets, if any
  load_secrets "${FORMULA}"

  # any custom preinstall steps
  if [ -f ./"${FORMULA}/preinstall.sh" ]
  then
    echo "  💟 Running preinstall script for ${NAME}"
    ./"${FORMULA}/preinstall.sh"
  fi

  # main installation
  brew install --quiet "${FORMULA}"

  # any custom setup steps
  if [ -f ./"${FORMULA}/setup.sh" ]
  then
    ./"${FORMULA}/setup.sh"
    echo "  💟 ${NAME} configured"
  fi
  echo "  ✅ ${NAME} installed"
}


function configure {
  local TARGET=$1
  local CONFIGURE_GUARD_PATH=$2

  echo "🛠  Configuring ${TARGET} ..."

  if [ -f "${CONFIGURE_GUARD_PATH}" ]
  then
    echo "  🆗 ${TARGET} already configured"
    return
  fi

  # load secrets, if any
  load_secrets "${TARGET}"

  # any setup script
  if [ -f ./"${TARGET}/setup.sh" ]
  then
    ./"${TARGET}/setup.sh"
    echo "  ❇️  ${TARGET} configured"
  else
    echo "  🆘 No setup script found for ${TARGET}"
  fi
}


echo "📦 Installing Homebrew ..."
if [ ! -f "/opt/homebrew/bin/brew" ]
then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo '# Homebrew environment variable setup' >> ~/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "  ✅ Homebrew installed"
else
  echo "  🆗 Homebrew already installed"
fi


# disable a few Homebrew features as they don't make sense during onboarding
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1


#
# brew_install <formula> <install_guard_path> <name>
#

# tools
brew_install google-chrome "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" "Google Chrome"
brew_install visual-studio-code "/opt/homebrew/bin/code" "VS Code"
brew_install iterm2 "/Applications/iTerm.app/Contents/MacOS/iTerm2" iTerm2
brew_install jq
brew_install tree
brew_install microsoft-outlook "/Applications/Microsoft Outlook.app/Contents/MacOS/Microsoft Outlook" "Microsoft Outlook"
brew_install microsoft-teams "/Applications/Microsoft Teams.app/Contents/MacOS/Teams" "Microsoft Teams"
brew_install forticlient-vpn "/Applications/FortiClient.app/Contents/MacOS/FortiClient" "FortiClient VPN"
#brew_install "cloudfoundry/tap/cf-cli@7" "cf CLI"

# programming languages and frameworks
brew_install docker
brew_install kubectl
brew_install kubectx
brew_install node "/opt/homebrew/bin/node" Node.js
brew_install python "/opt/homebrew/bin/python3" Python
brew_install go


#
# configure <target> [<configure_guard_path>]
#
configure iterm2
configure git
configure microsoft-company-portal "/Applications/Company Portal.app/Contents/MacOS/Company Portal"

