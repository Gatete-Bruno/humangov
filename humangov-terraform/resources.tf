

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Create a local file named notes.txt
resource "local_file" "notes" {
  content  = "This file is created by Terraform"
  filename = "notes.txt"
}