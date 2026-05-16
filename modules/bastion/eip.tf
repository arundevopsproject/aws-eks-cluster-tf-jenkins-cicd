# EIP for Bastion Host
resource "aws_eip" "bastion" {

  domain = "vpc"

  instance = aws_instance.bastion.id

  tags = {

    Name = "${var.environment}-bastion-eip"
  }
}
