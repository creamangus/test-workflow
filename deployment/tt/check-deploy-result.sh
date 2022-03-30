#!/bin/bash

DEPLOY_RESULT=""
if [ -f "../../deploy-result-app31.txt" ]; then
  if [ `grep -c "Fail:" ../../deploy-result-app31.txt` -ne '0' ]; then
    DEPLOY_RESULT="App31 deploy failed;"
  fi
  rm ../../deploy-result-app31.txt
fi
if [ -f "../../deploy-result-app32.txt" ]; then
  if [ `grep -c "Fail:" ../../deploy-result-app32.txt` -ne '0' ]; then
    DEPLOY_RESULT=$DEPLOY_RESULT"App32 deploy failed;"
  fi
  rm ../../deploy-result-app32.txt
fi
if [ -n "${DEPLOY_RESULT}" ]; then
  echo "::error::${DEPLOY_RESULT}"
  exit 1
fi