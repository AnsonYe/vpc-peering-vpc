output "instance_in_vpc1_public_ip" {
  value       = aws_instance.instance_in_vpc1.public_ip
  description = "The public IP address of the instance."
}

output "instance_in_vpc1_private_ip" {
  value       = aws_instance.instance_in_vpc1.private_ip
  description = "The private IP address of the instance."
}

output "instance_in_vpc1_hostname" {
  value       = aws_instance.instance_in_vpc1.id
  description = "The id of the instance."
}


output "instance_in_vpc2_public_ip" {
  value       = aws_instance.instance_in_vpc2.public_ip
  description = "The public IP address of the instance."
}

output "instance_in_vpc2_private_ip" {
  value       = aws_instance.instance_in_vpc2.private_ip
  description = "The private IP address of the instance."
}

output "instance_in_vpc2_hostname" {
  value       = aws_instance.instance_in_vpc2.id
  description = "The id of the instance."
}

output "tokyo_route_table_id" {
  value       = aws_default_route_table.public1.id
  description = "The ID of the Tokyo's route table"
}

output "osaka_route_table_id" {
  value       = aws_default_route_table.public2.id
  description = "The ID of the Osaka's route table"
}

output "tokyo_vpc_cidr_block" {
  value       = aws_vpc.vpc1.cidr_block
  description = "The CIDR block of the Tokyo's VPC"
}

output "tokyo_vpc_subnet_cidr_block" {
  value = [
    aws_subnet.vpc1_subnet1.cidr_block,
    aws_subnet.vpc1_subnet2.cidr_block
  ]
  description = "The CIDR block of the Tokyo VPC's Subnets"
}

output "vpc_peering_connection_id" {
  value       = aws_vpc_peering_connection.peer.id
  description = "The ID of the VPC peering connection"
}

output "osaka_vpc_cidr_block" {
  value       = aws_vpc.vpc2.cidr_block
  description = "The CIDR block of the Osaka's VPC"
}

output "osaka_vpc_subnet_cidr_block" {
  value = [
    aws_subnet.vpc2_subnet1.cidr_block
  ]
  description = "The CIDR block of the Osaka VPC's Subnets"
}