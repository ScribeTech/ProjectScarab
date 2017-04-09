#!/bin/bash
set -ex
git remote add deploy $DEPLOY_REMOTE
git push -f deploy master | yes
exit 0
