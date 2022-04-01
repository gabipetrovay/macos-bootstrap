#!/usr/bin/env bash
echo $GIT_USER_NAME
git config --global init.defaultBranch master

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"
