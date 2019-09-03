#!/usr/bin/env sh
set -e

config_path=$(readlink -f $1)
unique_name="1d9-tome-of-worlds"

echo "credentials \"app.terraform.io\" { token = \"$TF_TOKEN\" }" > ~/.terraformrc

(
  cd ./buildstore;
  terraform init;
  terraform plan --out plan.tfplan -var-file=$config_path/terra-astra.config.json
  terraform apply plan.tfplan;
  terraform output -json > buildstore-output.json
)