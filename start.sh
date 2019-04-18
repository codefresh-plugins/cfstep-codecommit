#!/bin/bash

rm -f ~/.my-credentials
rm -rf /codefresh/volume/${CF_REPO_NAME}
git config --global credential.helper 'store --file ~/.my-credentials'
echo https://${GIT_USER}:${GIT_PASSWORD}@git-codecommit.${REGION}.amazonaws.com >> ~/.my-credentials
git clone https://git-codecommit.${REGION}.amazonaws.com/v1/repos/${CF_REPO_NAME} /codefresh/volume/${CF_REPO_NAME}
cd /codefresh/volume/${CF_REPO_NAME}
git checkout ${CF_BRANCH}
