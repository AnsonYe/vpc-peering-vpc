# Terraform AWS VPC Peering Connection Module

This repository contains Terraform code for creating a VPC peering connection between two VPCs within AWS. VPC peering enables resources in different VPCs to communicate with each other as if they are within the same network. This can be beneficial for different teams, stages of the environment (dev, staging, prod), or different parts of the same application to communicate securely and efficiently.

## Prerequisites

- Terraform 1.2.1
- AWS Account
- AWS CLI configured with the necessary permissions.

## Usage
1. Initialize Terraform:
   ```sh
    terraform init
    ```
2. Apply the configuration:
   ```sh
    terraform apply
    ```
3. Once you're done, you can destroy the resources to avoid any charges:
   ```sh
    terraform destroy
    ```
