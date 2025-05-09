variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
variable "port" {
  description = "The port number for the target group"
  type        = number
  default     = 80
}
variable "protocol" {
  description = "The protocol for the target group"
  type        = string
  default     = "HTTP"
}
variable "name" {
  description = "Name of the target group"
  type        = string
}
variable "target_arns" {
  description = "List of ARNs of the target"
  type = list(string)
}
variable "health_check_path" {
  description = "Health check path"
  type        = string
  default     = "/"
}