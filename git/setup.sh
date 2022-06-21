#!/usr/bin/env bash

git config --global init.defaultBranch master
git config --global pull.rebase false
git config --global core.pager "less -FX"

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"
git config --global author.name "${GIT_USER_NAME}"
git config --global author.email "${GIT_USER_EMAIL}"

if [ -n "${GIT_WORK_CONFIG}" ]
then
  git config --global "includeIf.${GIT_WORK_CONFIG_CONDITION}.path" "${GIT_WORK_CONFIG_PATH}"

  echo "${GIT_WORK_CONFIG}" > "${GIT_WORK_CONFIG_PATH}"
fi
