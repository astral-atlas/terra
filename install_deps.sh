#!/usr/bin/env sh
set -e

echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Download some Alpine Packages
apk update
apk add aws-cli wget make nodejs unzip

# Download Terraform
terraform_zip_url="https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip"
wget -O terraform.zip -q $terraform_zip_url
unzip terraform.zip -d ./bin
PATH=$PATH:$(pwd)./bin

exit 0;