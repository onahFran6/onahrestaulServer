variable "family" {
  type        = string
  description = "The name of the task definition family"
}

variable "container_definitions" {
  type = list(object({
    name      = string,
    image     = string,
    cpu       = number,
    memory    = number,
    essential = bool,
    portMappings = list(object({
      containerPort = number,
      hostPort      = number,
      protocol      = string
    })),
    environmentFiles = list(object({
      type  = string,
      value = string
    })),
    logConfiguration = object({
      logDriver = string,
      options = map(string)
    })
  }))
  description = "List of container definitions"
}


variable "cpu" {
  type        = string
  description = "The number of CPU units used by the task"
}

variable "memory" {
  type        = string
  description = "The amount of memory (in MiB) used by the task"
}

variable "execution_role_arn" {
  type        = string
  description = "The ARN of the IAM role that grants the ECS agent permission to make AWS API calls"
}

variable "task_role_arn" {
  type        = string
  description = "The ARN of the IAM role that containers in this task can assume"
}
