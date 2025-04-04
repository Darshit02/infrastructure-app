Multi-Environment Infrastructure with Terraform and Ansible

Introduction

This comprehensive DevOps project demonstrates how to set up a robust, multi-environment infrastructure using Terraform for provisioning and Ansible for configuration management. The project includes development, staging, and production environments with a focus on automation, scalability, and best practices.

Project Overview

The project includes:

Installing Terraform and Ansible

Setting up AWS infrastructure

Creating dynamic inventories

Configuring Nginx across environments

Automating infrastructure management

1. Installing Terraform and Ansible

a. Installing Terraform on Ubuntu

sudo apt-get update
sudo apt-get install -y gnupg software-properties-common
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install terraform
terraform --version

b. Installing Ansible on Ubuntu

sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
ansible --version

2. Project Directory Structure

Create Project Directories

mkdir <your-project-name> && cd <your-project-name>
mkdir terraform
mkdir ansible

Expected Structure:

<your-project-name>/
├── terraform/
└── ansible/

3. Terraform Infrastructure Directory

Navigate and Create Infra Directory

cd terraform
mkdir infra && cd infra

Files to Create:

bucket.tf: S3 Bucket for state

dynamodb.tf: DynamoDB Table for locking

ec2.tf: EC2 instance setup

output.tf: Output values (e.g., public IPs)

variable.tf: Declare variables

Infra Structure:

infra/
├── bucket.tf
├── dynamodb.tf
├── ec2.tf
├── output.tf
└── variable.tf

4. Main Terraform Files (Multi-Environment Setup)

a. Create Main Infrastructure Files

cd ..
touch main.tf providers.tf terraform.tf

b. SSH Key Generation

ssh-keygen -t rsa -b 2048 -f devops-key -N ""
chmod 400 devops-key

Generates:

devops-key: Private key

devops-key.pub: Public key

Final Structure:

├── devops-key
├── devops-key.pub
├── infra/
│   ├── bucket.tf
│   ├── dynamodb.tf
│   ├── ec2.tf
│   ├── output.tf
│   └── variable.tf
├── main.tf
├── providers.tf
└── terraform.tf

5. Running Terraform Commands

a. Initialize

terraform init

b. Plan

terraform plan

c. Apply

terraform apply

d. Access EC2

ssh -i devops-key ubuntu@<your-ec2-ip>

Visual Confirmation (Post Apply)

EC2 Instances Running ✅

S3 Buckets Created ✅

DynamoDB for Locking ✅

