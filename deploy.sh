#!/bin/sh
eval "$(ssh-agent -s)"
KEY_ENC=.travis/sandbox.pem.enc
KEY=.travis/sandbox.pem
openssl aes-256-cbc -K $encrypted_c6c040438739_key -iv $encrypted_c6c040438739_iv -in $KEY_ENC -out $KEY -d
rm $KEY_ENC
chmod 600 $KEY
mv $KEY_ENC ~/.ssh/id_rsa
git remote add deploy $DEPLOY_REMOTE
git add -A .
git commit -m "Deploy"
git push -f deploy master
