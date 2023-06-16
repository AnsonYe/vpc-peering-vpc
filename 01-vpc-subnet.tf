# Your VPCs 创建第一个 VPC
resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC1"
  }
}

resource "aws_subnet" "vpc1-subnet1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-3a"

  tags = {
    Name = "SUBNET1(VPC1)"
  }
}
resource "aws_subnet" "vpc1-subnet2" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-3a"

  tags = {
    Name = "SUBNET2(VPC1)"
  }
}

# Your VPCs 创建第二个 VPC
resource "aws_vpc" "vpc2" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "VPC2"
  }
}

resource "aws_subnet" "vpc2-subnet1" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "ap-northeast-3a"

  tags = {
    Name = "SUBNET1(VPC2)"
  }
}
