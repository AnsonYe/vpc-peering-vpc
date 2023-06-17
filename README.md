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

## Configuring GitHub Secrets

Before you run GitHub Actions with this repository, you need to configure the following secrets in your GitHub repository:

- `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
- `AWS_PUBLIC_KEY`: The public key that you want to use for the AWS key pair.

To configure these secrets:

1. Go to your GitHub repository.
2. Click on "Settings" then select "Secrets and variables".
3. Select "Actions" then click "New repository secret" and add each secret with its respective value.
