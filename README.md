# Infra-App

A simple infrastructure setup using **Terraform** to create and manage **Production**, **Staging**, and **Development** environments.

## Overview

This project helps automate the provisioning of isolated environments using Infrastructure as Code (IaC) with Terraform. Ideal for teams or individuals looking to streamline their DevOps workflow.

## Project Structure

```
infra-app/
├── production/      # Production environment configs
├── staging/         # Staging environment configs
├── development/     # Development environment configs
├── modules/         # Reusable Terraform modules
├── main.tf          # Main Terraform configuration
├── backend.tf       # Remote state backend setup
├── variables.tf     # Input variables
└── README.md
```

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) v1.x or later  
- An active cloud provider account (e.g., AWS, GCP, or Azure)  
- Remote backend setup (S3, GCS, etc.) — optional but recommended

##  Getting Started

1. **Initialize Terraform**  
   ```
   terraform init
   ```

2. **Select Environment**  
   Navigate into the desired environment directory:  
   ```
   cd production  # or staging / development
   ```

3. **Plan & Apply**  
   ```
   terraform plan -var-file=../environments.tfvars
   terraform apply -var-file=../environments.tfvars
   ```

## Features

- Separate environments for production, staging, and development  
- Modular and reusable Terraform components  
- Easy to extend and customize

## 📄 License

MIT License

