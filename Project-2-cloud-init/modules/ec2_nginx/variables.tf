variable "ami_id" {
    description = "AMI ID used for ec2 instance"
    type = string
}

variable "instance_type" {
    description = "ec2 instance type"
    type = string
}

variable "key_name" {
    description = "existing aws key pair name"
    type = string
}

variable "allowed_ssh_cidr" {
    description = "CIDR block allowed to SSH into the ec2 instance"
    type = string 
}

variable "user_data" {
    description = "Cloud-init script content"
    type = string
}
