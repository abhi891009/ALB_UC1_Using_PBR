terraform {
  backend "s3" {
    bucket = "my_terraform_bucket11"
    key    = "my_terraform_bucket11"             # Path within the bucket
    region = "us-east-1"                      
  }
}