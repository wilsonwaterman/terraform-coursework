resource "aws_instance" "sample" {
    ami                     = var.AMIS[var.AWS_REGION]
    instance_type           = "t2.micro"

    # Target VPC Subnet
    subnet_id               = aws_subnet.main-public-1.id

    # Apply Security Group
    vpc_security_group_ids  = [aws_security_group.allow-ssh.id]

    # Provide public SSH Key
    key_name                = aws_key_pair.mykey.key_name
}