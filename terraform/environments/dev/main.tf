module "network" {
  source             = "../../modules/network"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones = var.availability_zones
}
module "security_group" {
  source                 = "../../modules/security_group"
  vpc_id                   = module.network.vpc_id
  alb_security_group_name  = var.alb_security_group_name
  ec2_security_group_name  = var.ec2_security_group_name
}
module "alb" {
  source             = "../../modules/alb"
  vpc_id             = module.network.vpc_id
  public_subnets_ids = module.network.public_subnets_ids
  alb_security_group_id = module.security_group.alb_security_group_id
}
module "ec2_instance_a" {
  source              = "../../modules/ec2_instance"
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = module.network.public_subnets_ids[0] # Instance A in AZ1
  security_group_ids    = [module.security_group.ec2_security_group_id]
  user_data             = file("./instance_a_user_data.sh")
}
module "ec2_instance_b" {
  source              = "../../modules/ec2_instance"
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = module.network.public_subnets_ids[1] # Instance B in AZ2
  security_group_ids    = [module.security_group.ec2_security_group_id]
  user_data             = file("./instance_b_user_data.sh")
}
module "ec2_instance_c" {
  source              = "../../modules/ec2_instance"
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = module.network.public_subnets_ids[2] # Instance C in AZ3
  security_group_ids    = [module.security_group.ec2_security_group_id]
  user_data             = file("./instance_c_user_data.sh")
}
module "target_group_a" {
  source = "../../modules/target_group"
  name = "tg-a"
  port = 80
  protocol = "HTTP"
  vpc_id = module.network.vpc_id
  target_arns = [module.ec2_instance_a.instance_arn]
  health_check_path = "/"
}
module "target_group_b" {
  source = "../../modules/target_group"
  name = "tg-b"
  port = 80
  protocol = "HTTP"
  vpc_id = module.network.vpc_id
  target_arns = [module.ec2_instance_b.instance_arn]
  health_check_path = "/images/"
}
module "target_group_c" {
  source = "../../modules/target_group"
  name = "tg-c"
  port = 80
  protocol = "HTTP"
  vpc_id = module.network.vpc_id
  target_arns = [module.ec2_instance_c.instance_arn]
  health_check_path = "/register/"
}
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = module.alb.alb_arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = module.target_group_a.target_group_arn
  }
}
resource "aws_lb_listener_rule" "register_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 10
  condition {
    path_pattern {
      values = ["/register*"]
    }
  }
  action {
    type             = "forward"
    target_group_arn = module.target_group_b.target_group_arn
  }
}
resource "aws_lb_listener_rule" "image_rule" {
  listener_arn = aws_lb_listener.http_listener.arn
  priority     = 20
  condition {
    path_pattern {
      values = ["/images*"]
    }
  }
  action {
    type             = "forward"
    target_group_arn = module.target_group_c.target_group_arn
  }
}