module "dev-infra" {
  source         = "./infra-app"
  env            = "dev"
  bucketname     = "infra-app-bucket"
  instance_count = 1
  instance_type  = "t2.micro"
  ec2_ami_id     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  hash_key       = "LazyId"                # Hash key for DynamoDB table
}

module "prd-infra" {
  source         = "./infra-app"
  env            = "prd"
  bucketname     = "infra-app-bucket"
  instance_count = 2
  instance_type  = "t2.medium"
  ec2_ami_id     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  hash_key       = "LazyId"                # Hash key for DynamoDB table
}

module "stg-infra" {
  source         = "./infra-app"
  env            = "stg"
  bucketname     = "infra-app-bucket"
  instance_count = 1
  instance_type  = "t2.small"
  ec2_ami_id     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  hash_key       = "LazyId"                # Hash key for DynamoDB table
}

