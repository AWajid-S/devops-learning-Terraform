
variable "aws_region" {
    description = "AWS region used to deploy"
    type = string
}

variable "ami_id"{
    description = "AMI ID for ec2 instance"
    type = string
}

variable "instance_type"{
    description = "type of ec2 isntance"
    type = string
}

variable "key_name"{
    description = "AWS key pair name"
    type = string
}

variable "allowed_ssh_cidr" {
    description = "CIDR block allowed to SSh into the ec2 instance"
    type = string
}