# Project 1 — Terraform WordPress Deployment

## Objective

Use Terraform to deploy a fully functional WordPress application on AWS.

This project demonstrates how Infrastructure as Code (IaC) can automate the provisioning of cloud resources, configure servers, and deploy applications without manual setup.

---

## Architecture Overview

This project provisions a simple web application architecture using Terraform:

- EC2 instance hosting WordPress
- Security Group for controlled access
- User Data script to automate installation
- Public endpoint for browser access

Terraform is used to manage the full lifecycle of infrastructure, from creation to destruction.

---

## Infrastructure Design

### EC2 Instance

- Instance Type: `t2.micro`
- Operating System: Amazon Linux
- Public IP: Enabled
- Purpose: Host WordPress and web server

---

### Security Group Configuration

- SSH (22): Allowed from my IP only
- HTTP (80): Allowed for web access

This ensures:
- Secure administrative access
- Public access to the website

---

### User Data Automation

A `user_data.sh` script is used to:

- Install Apache, PHP, and MySQL dependencies
- Download and configure WordPress
- Start and enable required services

This allows the EC2 instance to be fully configured automatically at launch.

---

## Terraform Structure

The project is organised using standard Terraform practices:

- `main.tf` → Defines AWS resources
- `variables.tf` → Input variables for flexibility
- `outputs.tf` → Displays key outputs (e.g. public IP)
- `terraform.tfvars.example` → Example configuration file
- `user_data.sh` → Bootstrap script for WordPress installation

---

## Deployment Process

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Validate configuration:
   ```bash
   terraform validate
   ```

3. Preview changes:
   ```bash
   terraform plan
   ```

4. Deploy infrastructure:
   ```bash
   terraform apply
   ```

After deployment, Terraform outputs the public IP address of the EC2 instance, which can be used to access the WordPress application in a browser.

---

## Testing & Validation

- Verified EC2 instance is successfully running in AWS
- Confirmed security group rules allow HTTP and restricted SSH access
- Accessed the WordPress installation page via the public IP
- Confirmed the user data script executed correctly during instance launch
- Ensured Terraform outputs returned the correct instance details

---

## Screenshots

Screenshots documenting the deployment process are available in the `/screenshots` directory, including:

- Terraform init, validate, plan, and apply
- EC2 instance running
- Security group configuration
- WordPress installation page

---

## Cost Considerations

All resources were provisioned temporarily for learning purposes and destroyed after testing.

Main cost contributors:

- EC2 instance (`t2.micro`)
- Minimal data transfer usage

Costs were kept low by limiting runtime and ensuring resources were cleaned up after use.

---

## What I Learned

- How Terraform automates infrastructure provisioning on AWS
- How to deploy a real-world application using Infrastructure as Code
- How user data scripts enable automatic server configuration
- How EC2 and security groups control access and connectivity
- The importance of writing reusable and structured Terraform code
- How to validate, plan, and safely apply infrastructure changes

  ---

## Error Handling & Debugging

During development, I encountered a configuration issue caused by a spelling mistake in the Terraform code.

This was identified using:

```bash
terraform validate
```

Terraform returned a validation error highlighting the incorrect syntax. After correcting the mistake, I re-ran validation to confirm the configuration was valid before proceeding to `terraform plan` and `terraform apply`.

This demonstrated the importance of using validation checks to catch errors early in the deployment process.
