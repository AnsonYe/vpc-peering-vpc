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