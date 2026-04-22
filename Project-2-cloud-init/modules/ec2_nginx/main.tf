resource "aws_security_group" "nginx_sg"{
    name = "nginx_sg"
    description = "Secuirty group for nginx ec2 instance"

    ingress {
        description = "allow ssh from my IP"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.allowed_ssh_cidr]
    }

    ingress {
        description = " Allow http from anywhere"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name = "nginx-sg"
    }
}

resource "aws_instance" "nginx" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.nginx_sg.id]
    user_data = var.user_data

    tags = {
        name = "cloud-init-nginx"
    }
}