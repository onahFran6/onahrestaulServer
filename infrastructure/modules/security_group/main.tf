resource "aws_security_group" "ecs_sg" {
  name        = "${var.security_group_name}-ecs"
  description = "ECS security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.security_group_name}-ecs"
  }
}


resource "aws_security_group" "ecs_lb_sg" {
  name        = "${var.security_group_name_ecs_lb}-ecs"
  description = "ECS to load balancer security group"
  vpc_id      = var.vpc_id

   # Allow all TCP traffic from the specified security group (sg-0a00e75be45b297ca / ema-sg)
  ingress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.security_group_name_ecs_lb}-ecs"
  }
}
