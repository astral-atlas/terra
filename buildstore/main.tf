variable "unique_name" {
  type = "string"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.unique_name}_application_bucket"
  acl    = "private"
}

resource "aws_elastic_beanstalk_application" "cartographer" {
  name        = "${var.unique_name}_cartographer_application"
  description = "Cartographer, the REST API for interacting with the Astral Atlas service"
}

output "app_bucket" {
  value = "${aws_s3_bucket.app_bucket.bucket}"
}
output "cartographer_app" {
  value = "${aws_elastic_beanstalk_application.cartographer.name}"
}
