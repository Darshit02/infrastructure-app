# key pair (login)
resource "aws_key_pair" "my_key" {
  key_name   = "${var.env}-infra-app-key"
  public_key = file("terra-key-ec2.pub")

  tags = {
    Environment =  var.env
    Name        = "${var.env}-infra-app-key"
    Description = "this key pair is used to login to ec2 instance"
  }
}

# VPC & Security Group
resource "aws_default_vpc" "default" {
  # default vpc
  # default vpc is created by AWS automatically
}

# security group
# security group is a virtual firewall that controls inbound and outbound traffic to AWS resources

resource "aws_security_group" "my_security_group" {
  name        = "${var.env}-infra-app-sg"
  description = "this will add a TF generated secturity group"
  #interpolation
  vpc_id = aws_default_vpc.default.id


  #inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }

  # outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all outbound traffic"
  }

  tags = {
    Name = "${var.env}-infra-app-sg"
    Environment = var.env
    Description = "this will add a TF generated secturity group"
  }

}

# ec2 instance
resource "aws_instance" "terra-ec2" {
    count = var.instance_count
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = var.instance_type
  #amazon machine image (ami)
  ami       = var.ec2_ami_id           # ubuntu 20.04
  # user_data = file("install_nginx.sh") # install nginx on ec2 instance
  root_block_device {
    volume_size = var.env == "prd" ? 15 : 10 # in GB
    volume_type = "gp3"                                                     # General Purpose SSD
  }
  tags = {
    Name = "${var.env}-infra-app-ec2-${count.index}"
  }
}
