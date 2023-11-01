provider "aws" {

}

variable "AWS_REGION" {
    type    = string
}

variable "AMIS" {
    type = map(string)
    default = {
        us-west-2 = "my ami"
    }
}

resource "aws_instance" "sample" {
    ami             = var.AMIS[var.AWS_REGION]
    instance_type   = "t2.micro"
}