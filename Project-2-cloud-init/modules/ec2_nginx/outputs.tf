output "instance_id" {
    description = "ID of ec2 insrtance"
    value = aws_instance.nginx.id
}

output "public_ip" {
    description = "Public IP address of the ec2 instance"
    value = aws_instance.nginx.public_ip
}

output  "public_DNS" {
    description = "Public DNS of ec2 instance"
    value = aws_instance.nginx.public_dns
}