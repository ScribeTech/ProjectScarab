#!/bin/bash
set -ex
git remote add deploy $DEPLOY_REMOTE
yes | git push -f deploy master
exit 0
