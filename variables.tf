# AWS region to deploy resources
variable "aws_region" {
  description = "AWS region"
  type        = string
}

# VPC ID where the bastion host will be launched
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

# Public subnet ID for the bastion host
variable "public_subnet_id" {
  description = "Public subnet ID for the bastion host"
  type        = string
}

# AMI ID to use for the bastion host (e.g., Amazon Linux 2)
variable "ami_id" {
  description = "AMI ID to use for the bastion host"
  type        = string
}

# EC2 instance type for the bastion host
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# SSH key pair name to access the bastion host
variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

# Allowed CIDR blocks for SSH access to the bastion host
variable "allowed_ssh_cidrs" {
  description = "List of CIDR blocks allowed to SSH to bastion"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # WARNING: Open to the world
}
