#!/bin/bash

# Deploy script example
# https://gist.github.com/domenic/ec8b0fc8ab45f39403dd#create-a-deploy-script
# 
# Test locally
# GH_USER=<username> GH_TOKEN=<generated token> GH_REF=github.com/<username>/<your repo>.git ./deploy.sh

set -e # exit with nonzero exit code if anything fails

# clear and re-create the out directory
rm -rf _site || exit 0;
mkdir _site;

# run our compile script, discussed above
./compile.sh

# go to the out directory and create a *new* Git repo
cd _site
touch .nojekyll
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "travis-ci@orlandodevs.com"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force "https://${GH_USER}:${GH_TOKEN}@${GH_REF}" master:ci-testing > /dev/null 2>&1
