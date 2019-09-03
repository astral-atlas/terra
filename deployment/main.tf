locals {
  cartographer_app_name = "${var.unique_name}-cartographer-application"
}

variable "production_cartographer_version" {
  type = "string"
}

variable "staging_cartographer_version" {
  type = "string"
}

data "aws_elastic_beanstalk_application" "cartographer_app" {
  name = "${local.cartographer_app_name}"
}

resource "aws_elastic_beanstalk_environment" "cartographer-production" {
  name                = "${local.cartographer_app_name}-production"
  application         = "${var.production_cartographer_version}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.12.16 running Docker 18.06.1-ce"
}

resource "aws_elastic_beanstalk_environment" "cartographer-staging" {
  name                = "${local.cartographer_app_name}-staging"
  application         = "${var.staging_cartographer_version}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.12.16 running Docker 18.06.1-ce"
}
