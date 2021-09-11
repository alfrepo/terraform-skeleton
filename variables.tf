variable "aws_region" {
  description = "The AWS region to deploy the resources into"
  type = string
  default = "eu-central-1"
}

variable "aws_account_id" {
  description = "The AWS account identifier of the project"
  type = string
  default = "1234567891234"
}

variable "prefix" {
  description = "The resource prefix"
  type = string
  default = "alf-dev-con1"
}


locals {
  iot_policy = "${var.prefix}-thing2"
}
