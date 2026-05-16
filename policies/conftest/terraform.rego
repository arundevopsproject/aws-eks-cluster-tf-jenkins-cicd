package terraform

deny[msg] {

  input.resource_type == "aws_s3_bucket"

  not input.config.versioning.enabled

  msg := "S3 bucket versioning must be enabled"
}
