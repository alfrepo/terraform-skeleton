
variable "aws_account_id" {
  description = "The AWS account identifier of the project"
  type = string
  default = "1234567891234"
}

# needs to be a var to reference from local block
variable "prefix" {
  description = "The resource prefix"
  type = string
  default = "alf-dev-tf-skelletton"
}

# needs to be a var to reference from local block
variable "environment" {
  description = "The environment"
  type = string

  # refers to folder-structure
  default = "env1" 
}


locals {
  aws_region =      "eu-central-1"
  environment_path = "environments/${var.environment}/"
  iot_policy = "${var.prefix}-thing2"

  # make also adressable via "var."
  prefix = "${var.prefix}"
  environment = "${var.environment}"     
}
