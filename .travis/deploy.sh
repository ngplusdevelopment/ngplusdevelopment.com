#!/bin/bash
set -e

BASEDIR=$(dirname "$0")

echo $BASEDIR

eval "$(ssh-agent -s)"

echo "Changing filemode"
chmod 600 ${BASEDIR}/deploy_key

echo "Adding SSH key"
ssh-add ${BASEDIR}/deploy_key

echo "Deploying"
ssh ngplusdevelopment@ngplusdevelopment.com "cd /srv/http/ngplusdevelopment.com/current && git pull"
