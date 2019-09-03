#!/usr/bin/env sh

config_path=$(readlink -f $1)
unique_name="1d9-tome-of-worlds"
echo $config_path

(
  cd ./buildstore;
  terraform init;
  terraform plan --out plan.tfplan -var-file=$config_path/terra-astra.config.json
  terraform apply plan.tfplan;
  terraform output -json > buildstore-output.json
)