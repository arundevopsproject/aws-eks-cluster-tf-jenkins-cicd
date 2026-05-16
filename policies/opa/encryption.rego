package encryption.security

deny[msg] {

  resource := input.resource_changes[_]

  resource.type == "aws_ebs_volume"

  not resource.change.after.encrypted

  msg := "EBS volumes must be encrypted"
}
