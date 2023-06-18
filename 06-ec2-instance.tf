# SSH KEY
resource "aws_key_pair" "deployer1" {
  provider   = aws.tokyo
  key_name   = "deployer-key"
  public_key = var.public_key
}

resource "aws_key_pair" "deployer2" {
  provider   = aws.osaka
  key_name   = "deployer-key"
  public_key = var.public_key
}

# 在第一个子网中创建 EC2 实例
resource "aws_instance" "instance_in_vpc1" {
  provider      = aws.tokyo
  ami           = "ami-0f9816f78187c68fb" # 注意：这个AMI ID可能会变，请检查最新的 Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpc1_subnet1.id

  # 使用密钥对
  key_name = aws_key_pair.deployer1.key_name

  # 使用默认的安全组
  vpc_security_group_ids = [aws_default_security_group.default.id]

  # 分配一个公网IP
  associate_public_ip_address = true

  tags = {
    Name = "Instance1-in-vpc1_subnet1"
  }
}

# 在第二个子网中创建 EC2 实例
resource "aws_instance" "instance_in_vpc2" {
  provider      = aws.osaka
  ami           = "ami-064150bf7525c78a7" # 注意：这个AMI ID可能会变，请检查最新的 Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpc2_subnet1.id

  # 使用密钥对
  key_name = aws_key_pair.deployer2.key_name

  # 使用之前自己创建的安全组
  vpc_security_group_ids = [aws_security_group.vpc2.id]

  # 分配一个公网IP
  associate_public_ip_address = true

  tags = {
    Name = "Instance1-in-vpc2_subnet1"
  }
}