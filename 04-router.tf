
# 默认路由表1
resource "aws_default_route_table" "public1" {
  provider               = aws.tokyo
  default_route_table_id = aws_vpc.vpc1.default_route_table_id

  tags = {
    Name = "Public1(VPC1)"
  }
}

resource "aws_route_table_association" "vpc1_subnet1-association" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.vpc1_subnet1.id
  route_table_id = aws_default_route_table.public1.id
}
resource "aws_route_table_association" "vpc1_subnet2-association" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.vpc1_subnet2.id
  route_table_id = aws_default_route_table.public1.id
}


# 默认路由表2
resource "aws_default_route_table" "public2" {
  provider               = aws.osaka
  default_route_table_id = aws_vpc.vpc2.default_route_table_id

  tags = {
    Name = "Public2(VPC2)"
  }
}

resource "aws_route_table_association" "vpc2_subnet1-association" {
  provider       = aws.osaka
  subnet_id      = aws_subnet.vpc2_subnet1.id
  route_table_id = aws_default_route_table.public2.id
}

# Route tables 更新路由表以允许流量通过 VPC 对等连接
resource "aws_route" "vpc1_route1" {
  provider                  = aws.tokyo
  route_table_id            = aws_vpc.vpc1.default_route_table_id
  destination_cidr_block    = aws_vpc.vpc2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
# Route tables 更新路由表以允许流量通过网关访问Internet
resource "aws_route" "public1_internet_gateway" {
  provider               = aws.tokyo
  route_table_id         = aws_vpc.vpc1.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw1.id
}

resource "aws_route" "vpc2_route1" {
  provider       = aws.osaka
  route_table_id = aws_vpc.vpc2.default_route_table_id
  #destination_cidr_block    = aws_vpc.vpc1.cidr_block
  destination_cidr_block    = aws_subnet.vpc1_subnet1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
resource "aws_route" "vpc2_route2" {
  provider                  = aws.osaka
  route_table_id            = aws_vpc.vpc2.default_route_table_id
  destination_cidr_block    = aws_subnet.vpc1_subnet2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
resource "aws_route" "public2_internet_gateway" {
  provider               = aws.osaka
  route_table_id         = aws_vpc.vpc2.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw2.id
}
