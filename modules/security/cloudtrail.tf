# S3 Bucket
resource "aws_s3_bucket" "cloudtrail" {

  bucket = "${var.environment}-cloudtrail-logs-bucket"

  tags = local.common_tags
}

# CloudTrail
resource "aws_cloudtrail" "this" {

  count = var.enable_cloudtrail ? 1 : 0

  name = "${var.environment}-cloudtrail"

  s3_bucket_name = aws_s3_bucket.cloudtrail.id

  include_global_service_events = true

  is_multi_region_trail = true

  enable_logging = true

  tags = local.common_tags
}

