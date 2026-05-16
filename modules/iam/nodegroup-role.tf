# Nodegroup IAM Role
resource "aws_iam_role" "nodegroup_role" {

  name = "${var.environment}-${var.cluster_name}-nodegroup-role"

  assume_role_policy = data.aws_iam_policy_document.nodegroup_assume_role.json

  tags = local.common_tags
}

# Worker Node Policy
resource "aws_iam_role_policy_attachment" "worker_node_policy" {

  role = aws_iam_role.nodegroup_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

# CNI Policy
resource "aws_iam_role_policy_attachment" "cni_policy" {

  role = aws_iam_role.nodegroup_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

# ECR ReadOnly
resource "aws_iam_role_policy_attachment" "ecr_readonly" {

  role = aws_iam_role.nodegroup_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# SSM Managed Instance
resource "aws_iam_role_policy_attachment" "ssm_managed" {

  role = aws_iam_role.nodegroup_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

