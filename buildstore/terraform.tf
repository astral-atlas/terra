terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "1d9"

    workspaces {
      name = "1d9-tome-of-world-buildstore"
    }
  }
}

provider "aws" {
  version = "~> 2.0"
  region  = "ap-southeast-2"
}