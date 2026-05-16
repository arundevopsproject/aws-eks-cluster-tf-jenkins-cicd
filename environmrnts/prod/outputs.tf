output "vpc_id" {

  value = module.network.vpc_id
}

output "private_subnet_ids" {

  value = module.network.private_subnet_ids
}

output "public_subnet_ids" {

  value = module.network.public_subnet_ids
}

output "eks_cluster_name" {

  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {

  value = module.eks.cluster_endpoint
}

output "kms_key_arn" {

  value = module.security.kms_key_arn
}

output "bastion_public_ip" {

  value = module.bastion.bastion_public_ip
}