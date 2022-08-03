resource "aws_vpc" "prod-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "prod-vpc"
  }
}

resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "prod-subnet-public-1"
  }
}

resource "aws_subnet" "prod-subnet-public-2" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "prod-subnet-public-2"
  }
}

resource "aws_subnet" "prod-subnet-private-1" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "prod-subnet-private-1"
  }
}

resource "aws_subnet" "prod-subnet-private-2" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "prod-subnet-private-2"
  }
}
