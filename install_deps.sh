#!/usr/bin/env sh

echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

apk update
apk add aws-cli terraform make nodejs
