resource "aws_s3_bucket" "infra-s3" {
    bucket = "${var.env}-${var.bucketname}"
    tags = {
      Name = "${var.env}-${var.bucketname}"
      Environment = var.env
    }
}