resource "aws_instance" "sample" {
    ami             = var.AMIS[var.AWS_REGION]
    instance_type   = "t2.micro"
    provisioner "local-exec" {
        command = "echo ${aws_instance.sample.private_ip} >> private_ips.txt"
    }
}

output "ip" {
    value = aws_instance.sample.public_ip
}
