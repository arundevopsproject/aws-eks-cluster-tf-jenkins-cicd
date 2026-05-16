# Public NACL
resource "aws_network_acl" "public" {

  vpc_id = aws_vpc.this.id

  subnet_ids = aws_subnet.public[*].id

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-public-nacl"
    }
  )
}

# Private NACL
resource "aws_network_acl" "private" {

  vpc_id = aws_vpc.this.id

  subnet_ids = aws_subnet.private[*].id

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-private-nacl"
    }
  )
}

