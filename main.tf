# Configure the AWS provider
provider "aws" {
  region = var.aws_region
}

# EC2 instance to act as the bastion host
resource "aws_instance" "bastion" {
  ami                    = var.ami_id                      # AMI ID (e.g., Amazon Linux 2)
  instance_type          = var.instance_type               # Instance type (e.g., t2.micro)
  subnet_id              = var.public_subnet_id            # Place in public subnet
  vpc_security_group_ids = [aws_security_group.bastion_sg.id] # Attach the bastion security group
  key_name               = var.key_name                    # SSH key pair for access

  tags = {
    Name = "BastionHost"
  }
}

# Security group allowing SSH access to the bastion host
resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow SSH access"
  vpc_id      = var.vpc_id

  # Inbound rule for SSH
  ingress {
    description = "SSH from allowed CIDRs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidrs  # Allowed CIDR blocks for SSH
  }

  # Outbound rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "BastionSG"
  }
}
