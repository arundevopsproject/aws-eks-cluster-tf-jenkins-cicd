# S3 Endpoint
resource "aws_vpc_endpoint" "s3" {

  vpc_id = aws_vpc.this.id

  service_name = "com.amazonaws.ap-south-1.s3"

  route_table_ids = [
    aws_route_table.private.id
  ]

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-s3-endpoint"
    }
  )
}

# ECR API Endpoint
resource "aws_vpc_endpoint" "ecr_api" {

  vpc_id = aws_vpc.this.id

  service_name = "com.amazonaws.ap-south-1.ecr.api"

  vpc_endpoint_type = "Interface"

  subnet_ids = aws_subnet.private[*].id

  private_dns_enabled = true
}

# ECR DKR Endpoint
resource "aws_vpc_endpoint" "ecr_dkr" {

  vpc_id = aws_vpc.this.id

  service_name = "com.amazonaws.ap-south-1.ecr.dkr"

  vpc_endpoint_type = "Interface"

  subnet_ids = aws_subnet.private[*].id

  private_dns_enabled = true
}


