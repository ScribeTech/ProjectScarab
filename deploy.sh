#!/bin/bash

set -x
export KEY_ENC=".travis/sandbox.pem.enc"
export KEY=".travis/sandbox.pem"
openssl aes-256-cbc -K $encrypted_c6c040438739_key -iv $encrypted_c6c040438739_iv -in $KEY_ENC -out $KEY -d
rm $KEY_ENC
chmod 600 $KEY
eval `ssh-agent -s`
ssh-add $KEY
rm $KEY
git add remote deploy "ssh://server@174.138.73.162/home/server/sandbox.git"
git push -f deploy master
exit 0
