#!/bin/bash
set -ex
git remote add deploy $DEPLOY_REMOTE
git push -fq deploy master
exit 0
