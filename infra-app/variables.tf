variable "env" {
  description = "The environment for the deployment (e.g., dev, staging, prod)"
  type        = string
}

variable "bucketname" {
  description = "The name of the S3 bucket. This should be unique across all AWS accounts."
  type        = string 
}

variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
}

variable "instance_type" {
  description = "The type of EC2 instance to create (e.g., t2.micro, t3.medium)"
  type        = string
}

variable "ec2_ami_id" {
  description = "The Amazon Machine Image (AMI) ID to use for the EC2 instance"
    type        = string
}

variable "hash_key" {
    description = "The hash key for the DynamoDB table"
    type        = string
}