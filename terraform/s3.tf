resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "my_terraform_bucket11"
  acl    = "private"
 
  versioning {
    enabled = true
  }
 
  tags = {
    Name        = "Terraform State Bucket"
    Environment = "dev"
  }
}