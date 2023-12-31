# Your VPCs 创建第一个 VPC
resource "aws_vpc" "vpc1" {
  provider   = aws.tokyo
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC1"
  }
}

resource "aws_subnet" "vpc1_subnet1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "SUBNET1(VPC1)"
  }
}
resource "aws_subnet" "vpc1_subnet2" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "SUBNET2(VPC1)"
  }
}

# Your VPCs 创建第二个 VPC
resource "aws_vpc" "vpc2" {
  provider   = aws.osaka
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "VPC2"
  }
}

resource "aws_subnet" "vpc2_subnet1" {
  provider          = aws.osaka
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "ap-northeast-3a"

  tags = {
    Name = "SUBNET1(VPC2)"
  }
}
