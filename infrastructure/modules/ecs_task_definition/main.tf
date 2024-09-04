resource "aws_ecs_task_definition" "this" {
  family                = var.family
  container_definitions = jsonencode(var.container_definitions)

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  tags = {
    Name = var.family
  }
}
