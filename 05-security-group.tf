# 默认安全组
resource "aws_default_security_group" "default" {
  provider = aws.tokyo
  vpc_id   = aws_vpc.vpc1.id

  tags = {
    Name = "VPC1"
  }
}
# Allow 22 (SSH)
resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_default_security_group.default.id
}
# Allow 80 (HTTP)
resource "aws_security_group_rule" "allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_default_security_group.default.id
}
# Allow Ping (ICMP)
resource "aws_security_group_rule" "allow_icmp" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["10.1.0.0/16"]
  security_group_id = aws_default_security_group.default.id
}
resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_default_security_group.default.id
}

# ---

# 创建的安全组
resource "aws_security_group" "vpc2" {
  provider    = aws.osaka
  name        = "vpc2"
  description = "VPC2 security group"
  vpc_id      = aws_vpc.vpc2.id

  tags = {
    Name = "VPC2"
  }
}
# Allow 22 (SSH)
resource "aws_security_group_rule" "allow_ssh2" {
  provider          = aws.osaka
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc2.id
}
# Allow 80 (HTTP)
resource "aws_security_group_rule" "allow_http2" {
  provider          = aws.osaka
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc2.id
}
# Allow Ping (ICMP)
resource "aws_security_group_rule" "allow_icmp2" {
  provider          = aws.osaka
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["10.0.0.0/16"]
  security_group_id = aws_security_group.vpc2.id
}
resource "aws_security_group_rule" "allow_all2" {
  provider          = aws.osaka
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc2.id
}
