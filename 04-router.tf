
# 默认路由表1
resource "aws_default_route_table" "public1" {
  default_route_table_id = aws_vpc.vpc1.default_route_table_id

  tags = {
    Name = "Public1(VPC1)"
  }
}

resource "aws_route_table_association" "vpc1-subnet1-association" {
  subnet_id      = aws_subnet.vpc1-subnet1.id
  route_table_id = aws_default_route_table.public1.id
}
resource "aws_route_table_association" "vpc1-subnet2-association" {
  subnet_id      = aws_subnet.vpc1-subnet2.id
  route_table_id = aws_default_route_table.public1.id
}


# 默认路由表2
resource "aws_default_route_table" "public2" {
  default_route_table_id = aws_vpc.vpc2.default_route_table_id

  tags = {
    Name = "Public2(VPC2)"
  }
}

resource "aws_route_table_association" "vpc2-subnet1-association" {
  subnet_id      = aws_subnet.vpc2-subnet1.id
  route_table_id = aws_default_route_table.public2.id
}

# Route tables 更新路由表以允许流量通过 VPC 对等连接
resource "aws_route" "route1" {
  route_table_id            = aws_vpc.vpc1.default_route_table_id
  destination_cidr_block    = aws_vpc.vpc2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
# Route tables 更新路由表以允许流量通过网关访问Internet
resource "aws_route" "public1_internet_gateway" {
  route_table_id         = aws_vpc.vpc1.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw1.id
}

resource "aws_route" "route2" {
  route_table_id            = aws_vpc.vpc2.default_route_table_id
  destination_cidr_block    = aws_vpc.vpc1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
resource "aws_route" "public2_internet_gateway" {
  route_table_id         = aws_vpc.vpc2.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw2.id
}
