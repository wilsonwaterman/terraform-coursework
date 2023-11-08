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

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone       = "us-west-2a"
    size                    = 20
    type                    = "gp2"
    tags = {
        Name = "extra volume data"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
    device_name                     = "/dev/xvdh"
    volume_id                       = aws_ebs_volume.ebs-volume-1.id
    instance_id                     = aws_instance.sample.id
    stop_instance_before_detaching  = true
}
