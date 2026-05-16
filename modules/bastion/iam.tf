# Bastion IAM Role
resource "aws_iam_role" "bastion" {

  name = "${var.environment}-bastion-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Principal = {

          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

# SSM Managed Policy
resource "aws_iam_role_policy_attachment" "ssm" {

  role = aws_iam_role.bastion.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# CloudWatch Agent Policy
resource "aws_iam_role_policy_attachment" "cloudwatch" {

  role = aws_iam_role.bastion.name

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# Instance Profile
resource "aws_iam_instance_profile" "bastion" {

  name = "${var.environment}-bastion-profile"

  role = aws_iam_role.bastion.name
}
