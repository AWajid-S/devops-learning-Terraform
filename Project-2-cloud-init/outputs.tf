output "instance_id" {
    description = "ID of the ec2 instance"
    value = module.ec2_nginx.instance_id
}

output "instance_public_ip"{
    description = "Public IP address of ec2 instance"
    value = module.ec2_nginx.public_ip
}

output "instance_public_dns" {
    description = "Public DNS of the ec2 instance"
    value = module.ec2_nginx.public_DNS
}

output  "website_url" {
    description = "URL to access nginx server"
    value = "http://${module.ec2_nginx.public_ip}"
}