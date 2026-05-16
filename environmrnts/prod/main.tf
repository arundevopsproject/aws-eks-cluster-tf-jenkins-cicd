module "network" {

  source = "../../modules/network"

  environment = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  azs = var.availability_zones
}

module "security" {

  source = "../../modules/security"

  vpc_id   = module.network.vpc_id
  vpc_cidr = var.vpc_cidr
}

module "iam" {

  source = "../../modules/iam"

  cluster_name = local.eks_cluster_name
}

module "eks" {

  source = "../../modules/eks"

  cluster_name = local.eks_cluster_name

  eks_version = var.eks_version

  cluster_role_arn = module.iam.eks_cluster_role_arn

  private_subnet_ids = module.network.private_subnet_ids

  kms_key_arn = module.security.kms_key_arn
}

module "nodegroups" {

  source = "../../modules/nodegroups"

  cluster_name = module.eks.cluster_name

  node_role_arn = module.iam.nodegroup_role_arn

  private_subnet_ids = module.network.private_subnet_ids
}

module "bastion" {

  source = "../../modules/bastion"

  public_subnet_id = module.network.public_subnet_ids[0]

  vpc_id = module.network.vpc_id
}

module "storage" {

  source = "../../modules/storage"

  cluster_name = module.eks.cluster_name
}

module "monitoring" {

  source = "../../modules/monitoring"

  cluster_name = module.eks.cluster_name
}

module "logging" {

  source = "../../modules/logging"

  cluster_name = module.eks.cluster_name
}

module "security_tools" {

  source = "../../modules/security-tools"

  cluster_name = module.eks.cluster_name
}

module "gitops" {

  source = "../../modules/gitops"

  cluster_name = module.eks.cluster_name
}

module "backup" {

  source = "../../modules/backup"

  cluster_name = module.eks.cluster_name
}

module "secrets" {

  source = "../../modules/secrets"

  cluster_name = module.eks.cluster_name
}

module "kubernetes" {

  source = "../../modules/kubernetes"

  cluster_name = module.eks.cluster_name
}

