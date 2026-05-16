# Bastion Security Group
resource "aws_security_group" "bastion" {

  name = "${var.environment}-bastion-sg"

  description = "Bastion Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "SSH Access"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = var.allowed_ssh_cidr
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {

    Name        = "${var.environment}-bastion-sg"

    Environment = var.environment

    ManagedBy   = "Terraform"
  }
}

