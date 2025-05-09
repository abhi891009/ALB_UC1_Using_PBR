variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
variable "public_subnets_ids" {
  description = "A list of IDs of public subnets"
  type        = list(string)
}
variable "alb_security_group_id" {
  description = "Security Group ID for ALB"
  type = string
}