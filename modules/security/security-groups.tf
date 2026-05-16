# EKS Cluster Security Group
resource "aws_security_group" "eks_cluster" {

  name        = "${var.environment}-eks-cluster-sg"
  description = "EKS Cluster Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "HTTPS"

    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      var.vpc_cidr
    ]
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-eks-cluster-sg"
    }
  )
}

# Nodegroup Security Group
resource "aws_security_group" "nodegroup" {

  name        = "${var.environment}-nodegroup-sg"
  description = "EKS Nodegroup Security Group"

  vpc_id = var.vpc_id

  ingress {

    description = "Node to Node"

    from_port = 0
    to_port   = 65535

    protocol = "tcp"

    self = true
  }

  ingress {

    description = "Cluster Communication"

    from_port = 443
    to_port   = 443

    protocol = "tcp"

    security_groups = [
      aws_security_group.eks_cluster.id
    ]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-nodegroup-sg"
    }
  )
}

# Bastion Security Group
resource "aws_security_group" "bastion" {

  name = "${var.environment}-bastion-sg"

  vpc_id = var.vpc_id

  ingress {

    description = "SSH Access"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-bastion-sg"
    }
  )
}



