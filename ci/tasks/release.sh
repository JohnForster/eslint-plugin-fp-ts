#!/bin/sh

set -e

LATEST_TAG=$(git describe --abbrev=0)
VERSION=${TAG#v}

git config --global user.email "nemobot@buildo.io"
git config --global user.name "Nemobot"

yarn install --no-progress
yarn version --no-git-tag-version --new-version $VERSION

git add .
git commit -m "v$VERSION"
git push origin HEAD:main

yarn config set _authToken $NPM_TOKEN
yarn publish --non-interactive