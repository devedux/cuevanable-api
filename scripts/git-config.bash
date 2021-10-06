#!/usr/bin/env bash

echo "Configuring git..."
git config --global user.email $GIT_USER_EMAIL
git config --global user.name $GIT_USER_NAME
git config advice.ignoredHook false
echo "Done!"
