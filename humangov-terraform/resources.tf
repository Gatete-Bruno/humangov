

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Create a local file named notes.txt
resource "local_file" "notes" {
  content  = "This file is created by Terraform"
  filename = "notes.txt"
}


resource "random_string" "bucket_name_suffix" {
    length = 5
    special = false
    upper = false
}


resource "aws_s3_bucket" "HG1_suffix" {
    bucket = "humangov-tf-test-bucket1-${random_string.bucket_name_suffix.result}"

    tags = {
        Application = var.application
        ProjectId = var.projectid
    }
}