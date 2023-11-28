
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

  # getting the  shared variables from environment, from the AWS parameter store

  # example of storing the param:
  # assuming that you stored  the variables under this prefix
  # resource "aws_ssm_parameter" "vpc_parameter_public_subnet_ids" {
  #   name  = "/${var.prefix}/${var.environment}/public_subnet_ids"
  #   type  = "StringList"
  #   value = jsonencode(module.vpc.public_subnets)
  # }

  prefix_shared_platform = "/alf-dev/shr1"
  public_subnet1_arn = jsondecode(data.aws_ssm_parameter.public_subnet_arns.value)[0]
  public_subnet2_arn = jsondecode(data.aws_ssm_parameter.public_subnet_arns.value)[1]
  public_subnet3_arn = jsondecode(data.aws_ssm_parameter.public_subnet_arns.value)[2]

  public_subnet1_id = jsondecode(data.aws_ssm_parameter.public_subnet_ids.value)[0]
  public_subnet2_id = jsondecode(data.aws_ssm_parameter.public_subnet_ids.value)[1]
  public_subnet3_id = jsondecode(data.aws_ssm_parameter.public_subnet_ids.value)[2]
}
