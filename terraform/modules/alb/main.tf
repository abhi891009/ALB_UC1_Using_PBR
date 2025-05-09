resource "aws_lb" "application_load_balancer" {
  name               = "application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnet_ids         = var.public_subnets_ids
  tags = {
    Name = "application-load-balancer"
  }
}