variable "ami_id" {
  description = "The AMI ID"
  type        = string
}
variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}
variable "subnet_id" {
  description = "The subnet ID"
  type        = string
}
variable "security_group_ids" {
  description = "A list of security group IDs"
  type        = list(string)
}
variable "user_data" {
  description = "User data for the instance"
  type        = string
}