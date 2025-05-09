resource "aws_lb_target_group" "target_group" {
  name     = var.name
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
  health_check {
    path = var.health_check_path
  }
}
resource "aws_lb_target_group_attachment" "target_group_attachment" {
  count = length(var.target_arns)
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = element(var.target_arns, count.index) #  instance_id
  port = 80
}