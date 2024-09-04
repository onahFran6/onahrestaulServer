# Terraform AWS Infrastructure Setup

This project uses Terraform to provision and manage AWS infrastructure. The infrastructure includes VPC, subnets, security groups, load balancers, ECS clusters, RDS instances, and S3 buckets.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) (Ensure you have the latest version installed)
- [AWS CLI](https://aws.amazon.com/cli/) (Ensure it's configured with the correct credentials)

## AWS CLI Setup

### Step 1: Configure AWS Credentials

You need to set up your AWS CLI with the appropriate credentials. Follow these steps:

1. **Install AWS CLI** (if not already installed):

   - On macOS, you can install AWS CLI using Homebrew:
     ```sh
     brew install awscli
     ```

2. **Set up AWS Credentials**:
   - Open or create the AWS credentials file:
     - On macOS/Linux: `~/.aws/credentials`
   - Add the following configuration (replace `YOUR_WORK_ACCESS_KEY` and `YOUR_WORK_SECRET_KEY` with the credentials sent to you via WhatsApp):
     ```ini
     [interwap]
     aws_access_key_id = YOUR_WORK_ACCESS_KEY
     aws_secret_access_key = YOUR_WORK_SECRET_KEY
     ```

### Step 2: Configure AWS CLI Profile

1. **Open or create the AWS config file**:
   - On macOS/Linux: `~/.aws/config`
2. **Add the following configuration**:
   ```ini
   [profile <profile name>]
   region = us-east-1
   output = json
   ```

### Step 3: Set AWS Profile

On your shell/CLI set the `AWS_PROFILE` environment variable:

```sh
export AWS_PROFILE=<profile name>
```

## Terraform Usage

### Step 1: Initialize the Terraform Project

Before you can use Terraform, you need to initialize your project directory. This will download the necessary provider plugins and modules.

```sh
terraform init
```

### Step 2: Plan the Infrastructure

To see what changes Terraform will make to your infrastructure, run the plan command:

```sh
terraform plan -var-file=terraform.tfvars
```

### Step 3: Apply the Configuration

When you're ready to apply the changes, use the following command. This will create and/or modify the infrastructure as defined in your Terraform files:

```sh
terraform apply -var-file=terraform.tfvars --auto-approve
```

### Step 4: Modify Terraform Variables

Before applying the Terraform configuration, ensure that the `terraform.tfvars` file has the correct values, especially for the ECS task definition and other environment-specific configurations.

### Step 5: Destroy the Infrastructure (Optional)

When you're finished and want to tear down the infrastructure, you can use the destroy command:

```sh
terraform destroy -var-file=terraform.tfvars --auto-approve
```
