#!/usr/bin/env sh
set -e

(cd buildstore; terraform init -backend=false)
(cd deployment; terraform init -backend=false)