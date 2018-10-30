#!/bin/bash
set -e

BASEDIR=$(dirname "$0")

eval "$(ssh-agent -s)"
chmod 600 ${BASEDIR}/deploy_key
ssh-add ${BASEDIR}/deploy_key

ssh ngplusdevelopment@ngplusdevelopment.com "cd /srv/http/ngplusdevelopment.com/current && git pull"
