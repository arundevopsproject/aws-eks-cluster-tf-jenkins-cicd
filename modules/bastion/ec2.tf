# Bastion Instance
resource "aws_instance" "bastion" {

  ami = var.ami_id

  instance_type = var.instance_type

  subnet_id = var.public_subnet_id

  associate_public_ip_address = var.associate_public_ip

  vpc_security_group_ids = [
    aws_security_group.bastion.id
  ]

  iam_instance_profile = aws_iam_instance_profile.bastion.name

  key_name = var.key_name

  user_data = file("${path.module}/userdata.sh")

  metadata_options {

    http_endpoint = "enabled"

    http_tokens = "required"

    http_put_response_hop_limit = 2
  }

  root_block_device {

    encrypted = true

    volume_size = 30

    volume_type = "gp3"
  }

  monitoring = true

  tags = {

    Name        = "${var.environment}-bastion"

    Environment = var.environment

    ManagedBy   = "Terraform"
  }
}


