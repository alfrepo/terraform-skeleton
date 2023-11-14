
resource "aws_iot_policy" "iot_policy" {
  name   = "${local.iot_policy}"
  policy = "${data.template_file.tf_iot_policy.rendered}"
}
