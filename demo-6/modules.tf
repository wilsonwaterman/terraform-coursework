resource "aws_key_pair" "mykey" {
    key_name        = "mykey"
    public_key      = file(var.PATH_TO_PUBLIC_KEY)
}

module "consul" {
    source      = "github.com/wardviaene/terraform-consul-module.git?ref=terraform-0.12"
    key_name    = aws_key_pair.mykey.key_name
    key_path    = var.PATH_TO_PRIVATE_KEY
    region      = var.AWS_REGION
    vpc_id      = aws_default_vpc.default.id
    subnets = {
        "0" = aws_default_subnet.default.az1.id
        "1" = aws_default_subnet.default.az2.id
        "2" = aws_default_subnet.default.az3.id
    }
}

output "consul-output" {
    value = module.consul.server_address
}
