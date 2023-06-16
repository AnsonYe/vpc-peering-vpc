# Internet网关1
resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = " IGW1(VPC1)"
  }
}

# Internet网关2
resource "aws_internet_gateway" "igw2" {
  vpc_id = aws_vpc.vpc2.id
  tags = {
    Name = " IGW2(VPC2)"
  }
}
