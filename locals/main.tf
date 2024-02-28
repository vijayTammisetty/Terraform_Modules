provider "aws" {
  
}

locals {
    
  bucket-name = "${var.layer}-${var.env}-buck"
}

resource "aws_s3_bucket" "name" {
    bucket = local.bucket-name
    for_each = toset(var.bucket_names)
    tags = {
      Name = each.value
      Environment = var.env
    }
  
}