#!/bin/sh -e

GIT_COMMIT_HASH=$(git rev-parse --short HEAD)
GIT_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

# if in Gitlab CI environment --> Use CI_COMMIT_REF_NAME instead
if [ -n "$CI_COMMIT_REF_NAME" ]; then
    GIT_BRANCH_NAME=$CI_COMMIT_REF_NAME
fi

# if assets/.env.git_information not existed --> Create it
if [ ! -e assets/env/.env.git_information ];
then
  echo assets/env/.env.git_information
else
  # Clear old GIT env before appending the new
  true > assets/env/.env.git_information
fi

if [ ! -s assets/env/.env.git_information ]; then
  echo >> assets/env/.env.git_information "GIT_COMMIT_HASH=$GIT_COMMIT_HASH"
  echo >> assets/env/.env.git_information "GIT_BRANCH_NAME=$GIT_BRANCH_NAME"
fi
