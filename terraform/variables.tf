variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
variable "availability_zones" {
  description = "List of Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
variable "alb_security_group_name" {
  description = "Name of the security group for the ALB"
  type        = string
  default     = "alb-sg"
}
variable "ec2_security_group_name" {
  description = "Name of the security group for the EC2 instances"
  type        = string
  default     = "ec2-sg"
}
variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-084568db4383264d4"
}