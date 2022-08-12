resource "aws_subnet" "main_public" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.cidr[count.index]
  availability_zone = var.az[count.index]
  count             = 2

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "main_private" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.123.3.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "private-subnet"
  }
}

data "aws_subnets" "sid" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.main_vpc.id]
  }

  tags = {
    Tier = "Public"
  }
}