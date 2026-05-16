# Elastic IP
resource "aws_eip" "nat" {

  count = var.enable_nat_gateway ? 1 : 0

  domain = "vpc"

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-nat-eip"
    }
  )
}


# NAT Gateway
resource "aws_nat_gateway" "this" {

  count = var.enable_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat[0].id

  subnet_id = aws_subnet.public[0].id

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-nat-gateway"
    }
  )

  depends_on = [
    aws_internet_gateway.this
  ]
}

