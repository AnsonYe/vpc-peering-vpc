# SSH KEY
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# 在第一个子网中创建 EC2 实例
resource "aws_instance" "instance_in_vpc1" {
  ami           = "ami-064150bf7525c78a7" # 注意：这个AMI ID可能会变，请检查最新的 Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpc1-subnet1.id

  # 使用密钥对
  key_name = aws_key_pair.deployer.key_name

  # 使用默认的安全组
  vpc_security_group_ids = [aws_default_security_group.default.id]

  # 分配一个公网IP
  associate_public_ip_address = true

  tags = {
    Name = "Instance1-in-VPC1-subnet1"
  }
}

# 在第二个子网中创建 EC2 实例
resource "aws_instance" "instance_in_vpc2" {
  ami           = "ami-064150bf7525c78a7" # 注意：这个AMI ID可能会变，请检查最新的 Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpc2-subnet1.id

  # 使用密钥对
  key_name = aws_key_pair.deployer.key_name

  # 使用之前自己创建的安全组
  vpc_security_group_ids = [aws_security_group.vpc2.id]

  # 分配一个公网IP
  associate_public_ip_address = true

  tags = {
    Name = "Instance1-in-VPC2-subnet1"
  }
}