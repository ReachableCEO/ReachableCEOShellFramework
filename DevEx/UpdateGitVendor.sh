#!/bin/bash

#git vendor list|grep @
#DSR-Pipeline-Server@main:
#mo@master:

export GIT_VENDOR_LIST
GIT_VENDOR_LIST="$(git vendor list|grep @|egrep 'main|master')"

IFS=$'\n\t'
for GIT_VENDOR in ${GIT_VENDOR_LIST[@]}; do
  export VENDOR_NAME
  VENDOR_NAME="$(echo $GIT_VENDOR|awk -F '@' '{print $1}')"
  export VENDOR_REF
  VENDOR_REF="$(echo $GIT_VENDOR|awk -F '@' '{print $2}'| sed 's/\://g')"
  git vendor update $VENDOR_NAME $VENDOR_REF
done

