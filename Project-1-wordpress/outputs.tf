

output "instance_public_ip" {
    value = aws_instance.wordpress.public_ip
}

output "instance_public_dns" {
    value = aws_instance.wordpress.private_dns
}

output "wordpress_url" {
value = "http://${aws_instance.wordpress.public_ip}"
}

## These outputs are used to print the information onto the terminal 
## and then i can use them in other areas if needed. Makes process smoother and faster. 