# Bastion Instance ID
output "bastion_instance_id" {

  value = aws_instance.bastion.id
}

# Bastion Public IP
output "bastion_public_ip" {

  value = aws_eip.bastion.public_ip
}

# Bastion Private IP
output "bastion_private_ip" {

  value = aws_instance.bastion.private_ip
}

# Bastion Security Group
output "bastion_security_group_id" {

  value = aws_security_group.bastion.id
}


