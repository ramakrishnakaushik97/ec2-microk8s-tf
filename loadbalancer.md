
# # create aws_lb
resource "aws_lb" "webapp-lb" {
  name               = "webapp-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [aws_subnet.subnet1.id]

  enable_deletion_protection = false

  tags = local.common_tags
}


# # create instance aws_lb_target_group
resource "aws_lb_target_group" "webapp-lb-tg" {
  name     = "webapp-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

# # create aws_lb_listener
resource "aws_lb_listener" "webapp-lb-listener" {
  load_balancer_arn = aws_lb.webapp-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp-lb-tg.arn
  }
}


# # create aws_lb_target_group_attachment
resource "aws_lb_target_group_attachment" "webapp-tg-attachments" {
  target_group_arn = aws_lb_target_group.webapp-lb-tg.arn
  target_id        = aws_instance.mediawiki_instance.id
  port             = 80
}