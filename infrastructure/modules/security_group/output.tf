output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}


output "ecs_lb_sg_id" {
  value = aws_security_group.ecs_lb_sg.id
}
