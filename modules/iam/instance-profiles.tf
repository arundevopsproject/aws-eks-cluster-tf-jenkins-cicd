# Bastion Instance Profile
resource "aws_iam_instance_profile" "bastion" {

  name = "${var.environment}-bastion-profile"

  role = aws_iam_role.nodegroup_role.name
}

