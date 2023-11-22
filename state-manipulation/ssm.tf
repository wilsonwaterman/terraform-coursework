resource "aws_ssm_parameter" "myparameter2" {
  name  = "/myapp/myparameter"
  type  = "String"
  value = "myvalue"
}
