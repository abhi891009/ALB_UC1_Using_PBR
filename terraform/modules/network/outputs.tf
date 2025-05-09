output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}
output "public_subnets_ids" {
  description = "A list of IDs of the public subnets"
  value       = aws_subnet.public_subnet[*].id
}