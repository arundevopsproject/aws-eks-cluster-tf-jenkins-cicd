# Public Route Table
resource "aws_route_table" "public" {

  vpc_id = aws_vpc.this.id

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-public-rt"
    }
  )
}

# Private Route Table
resource "aws_route_table" "private" {

  vpc_id = aws_vpc.this.id

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-private-rt"
    }
  )
}
