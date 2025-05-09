variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
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