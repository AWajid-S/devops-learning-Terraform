terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = var.aws_region
}

module "ec2_nginx" {
    source = "./modules/ec2_nginx"

    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    allowed_ssh_cidr = var.allowed_ssh_cidr
    user_data = file("${path.module}/cloud-init.yaml")
}