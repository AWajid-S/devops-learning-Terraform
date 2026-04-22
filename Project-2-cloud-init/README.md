# Project 2 — EC2 Deployment with Cloud-Init

## Objective

Use Terraform and cloud-init to deploy a fully configured EC2 instance on AWS.

This project demonstrates how Infrastructure as Code (IaC) can automate both infrastructure provisioning and server configuration during instance boot.

---

## Architecture Overview

This project provisions a simple automated server setup:

- EC2 instance running Ubuntu
- Security Group for controlled access
- Cloud-init YAML file for automated configuration
- Public endpoint serving a web page via NGINX

Terraform manages the infrastructure, while cloud-init handles server configuration.

---

## Infrastructure Design

### EC2 Instance

- Instance Type: `t2.micro`
- Operating System: Ubuntu
- Public IP: Enabled
- Purpose: Host a web server configured automatically at launch

---

### Security Group Configuration

- SSH (22): Allowed only from my IP
- HTTP (80): Allowed from anywhere

This ensures:
- Secure administrative access
- Public access to the web server

---

### Cloud-Init Automation

A `cloud-init.yaml` file is used to configure the instance during its first boot.

The configuration performs the following:

- Updates package lists
- Installs NGINX
- Writes a custom HTML page
- Enables and starts the NGINX service

This ensures the server is fully configured without any manual SSH steps.

---

## Terraform Structure

The project is organised using a modular Terraform structure:

### Root Module

- `main.tf` → Defines provider and calls the module
- `variables.tf` → Input variables
- `outputs.tf` → Displays key outputs
- `terraform.tfvars.example` → Example configuration
- `cloud-init.yaml` → Cloud-init configuration

### Child Module (`modules/ec2_nginx`)

- `main.tf` → Defines EC2 instance and security group
- `variables.tf` → Module input variables
- `outputs.tf` → Returns instance details

---

## Deployment Process

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Validate configuration

```bash
terraform validate
```

### 3. Preview changes

```bash
terraform plan
```

### 4. Deploy infrastructure

```bash
terraform apply
```

After deployment, Terraform outputs the public IP and URL of the EC2 instance.

---

## Testing & Validation

- Verified EC2 instance launched successfully
- Confirmed security group rules were applied correctly
- Accessed the NGINX web page via the public IP
- Confirmed cloud-init executed during instance boot
- Verified Terraform outputs returned correct values

---

## Screenshots

Screenshots documenting the deployment are available in the `/screenshots` directory, including:

- Terraform init, validate, plan, apply and destroy
- EC2 instance running
- Security group configuration
- NGINX web page

---

## Cost Considerations

All resources were created temporarily for learning purposes and destroyed after testing.

Main cost contributors:

- EC2 instance (`t2.micro`)
- Minimal data transfer usage

Costs were kept low by limiting runtime.

---

## What I Learned

- How cloud-init automates server configuration at first boot
- The difference between user_data scripts and cloud-init YAML
- How Terraform modules improve structure and reusability
- How to pass configuration files into EC2 using `user_data`
- The importance of validating and planning infrastructure

---

## Error Handling & Debugging

During development, I encountered several issues:

- Syntax errors (e.g. incorrect `tags` format)
- Spelling mistakes in resource definitions
- Incorrect file naming (`variable.tf` instead of `variables.tf`)

These were identified using:

```bash
terraform validate
```

I also discovered that updating `cloud-init.yaml` did not update the running instance.

This is because cloud-init only runs during the first boot. To apply changes, the EC2 instance had to be recreated using:

```bash
terrafrom destroy
teraform apply
```

This reinforced the importance of understanding how infrastructure provisioning differs from application updates.
