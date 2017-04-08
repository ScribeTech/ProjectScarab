#!/bin/sh

KEY_ENC=".travis/sandbox.pem.enc"
KEY=".travis/sandbox.pem"
openssl aes-256-cbc -K $encrypted_c6c040438739_key -iv $encrypted_c6c040438739_iv -in $KEY_ENC -out $KEY -d
rm $KEY_ENC
chmod 600 $KEY
eval `ssh-agent -s`
ssh-add $KEY
rm $KEY
git add remote deploy $DEPLOY_REMOTE
git push -f deploy master
exit 0
