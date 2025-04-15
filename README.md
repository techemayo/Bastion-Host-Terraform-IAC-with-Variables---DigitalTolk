# Terraform Bastion Host

This Terraform module creates an EC2 instance to be used as a **bastion host** in an existing AWS VPC with public subnets. It allows secure SSH access to private instances via the bastion.

## Features

- Launches a single EC2 instance as a bastion host
- Configurable instance type, AMI, and subnet
- Security Group with SSH access from specified CIDR blocks
- Outputs the public IP of the bastion instance

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured
- An existing VPC and public subnet
- An existing EC2 key pair for SSH

## Usage

```hcl
module "bastion" {
  source = "./path-to-this-module"

  aws_region        = "us-east-1"
  vpc_id            = "vpc-xxxxxxxx"
  public_subnet_id  = "subnet-xxxxxxxx"
  ami_id            = "ami-xxxxxxxx"       # Use Amazon Linux 2 or your preferred image
  instance_type     = "t2.micro"
  key_name          = "my-keypair"
  allowed_ssh_cidrs = ["203.0.113.0/24"]   # Replace with your IP range
}
```

## Outputs

Name	            Description
bastion_public_ip	Public IP of the bastion host

## Notes for Securing the Instance:
Default SSH access is open to all (0.0.0.0/0). You should restrict this using allowed_ssh_cidrs for security.

Consider using AWS Systems Manager (SSM) for more secure access without requiring SSH.