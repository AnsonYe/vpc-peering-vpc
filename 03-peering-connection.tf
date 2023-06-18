# Peering connections 创建 VPC 对等连接
resource "aws_vpc_peering_connection" "peer" {
  provider    = aws.tokyo
  vpc_id      = aws_vpc.vpc1.id
  peer_vpc_id = aws_vpc.vpc2.id
  peer_region = "ap-northeast-3"
  auto_accept = false

  tags = {
    Name = "VPC1 - VPC2"
  }
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.osaka
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true
}