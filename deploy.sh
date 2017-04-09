#!/bin/bash
KEY_ENC=.travis/sandbox.pem.enc
KEY=.travis/sandbox.pem
openssl aes-256-cbc -K $encrypted_c6c040438739_key -iv $encrypted_c6c040438739_iv -in $KEY_ENC -out $KEY -d
chmod 600 $KEY
eval "$(ssh-agent -s)"
ssh-add $KEY
rm $KEY
./keyscan > ~/.ssh/known_hosts
git remote add deploy $DEPLOY_REMOTE
yes yes | git push -qf deploy master
echo "yes"
exit 0
