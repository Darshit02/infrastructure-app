output "ec2_public_ips" {
    value = aws_instance.terra-ec2[*].public_ip
    description = "Public IP addresses of AWS EC2 instances"
}