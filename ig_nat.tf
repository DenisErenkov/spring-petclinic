resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id
  tags = {
    Name = "pet-igw"
  }
}

resource "aws_eip" "nat_eip1" {
  vpc        = true
  depends_on = [aws_internet_gateway.prod-igw]
}

resource "aws_eip" "nat_eip2" {
  vpc        = true
  depends_on = [aws_internet_gateway.prod-igw]
}

resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.nat_eip1.id
  subnet_id     = aws_subnet.prod-subnet-private-1.id

  tags = {
    Name = "nat_private_1"
  }
}

resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.nat_eip2.id
  subnet_id     = aws_subnet.prod-subnet-private-2.id

  tags = {
    Name = "nat_private_2"
  }
}