package terraform.security

deny[msg] {

  resource := input.resource_changes[_]

  resource.type == "aws_security_group"

  ingress := resource.change.after.ingress[_]

  ingress.cidr_blocks[_] == "0.0.0.0/0"

  ingress.from_port == 22

  msg := "SSH access from 0.0.0.0/0 is not allowed"
}
