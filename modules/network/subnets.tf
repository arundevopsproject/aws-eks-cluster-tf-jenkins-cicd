# Public Subnets
resource "aws_subnet" "public" {

  count = length(var.public_subnets)

  vpc_id = aws_vpc.this.id

  cidr_block = var.public_subnets[count.index]

  availability_zone = var.azs[count.index]

  map_public_ip_on_launch = true

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-public-subnet-${count.index + 1}"

      "kubernetes.io/role/elb" = "1"

      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    }
  )
}


# Private Subnets
resource "aws_subnet" "private" {

  count = length(var.private_subnets)

  vpc_id = aws_vpc.this.id

  cidr_block = var.private_subnets[count.index]

  availability_zone = var.azs[count.index]

  tags = merge(

    local.common_tags,

    {
      Name = "${var.environment}-private-subnet-${count.index + 1}"

      "kubernetes.io/role/internal-elb" = "1"

      "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    }
  )
}


