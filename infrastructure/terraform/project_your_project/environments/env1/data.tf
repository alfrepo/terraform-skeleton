#
# Gets information from environment
#  e.g. permissions_boundary = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/gitlab-runner/horizonboundary"
#
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}


# import the AWS parameter store variables from the environment
# which you have deployed there during bootstrap
# 12-factor-app store config in environment

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "${local.prefix_shared_platform}/public_subnet_ids"  # Use the same path used for storage
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "${local.prefix_shared_platform}/private_subnet_ids"  # Use the same path used for storage
}