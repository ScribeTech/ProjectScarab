#!/bin/bash

set -ex
KEY_ENC="./.travis/sandbox.pem.enc"
KEY="./.travis/sandbox.pem"
openssl aes-256-cbc -K $encrypted_c6c040438739_key -iv $encrypted_c6c040438739_iv -in $KEY_ENC -out $KEY -d
chmod 600 $KEY
eval "$(ssh-agent -s)"
ssh-add $KEY
rm $KEY
git remote add deploy ssh://server@174.138.73.162/home/server/sandbox.git
git push -f deploy
exit 0
