variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "public_subnet_count" {
  type        = number
  description = "The number of public subnets to create"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "security_group_name" {
  type        = string
  description = "The name of the security group"
}

variable "lb_name" {
  type        = string
  description = "The name of the Load Balancer"
}

variable "target_group_name" {
  type        = string
  description = "The name of the target group"
}

variable "family" {
  type        = string
  description = "The name of the ECS task definition family"
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

variable "cluster_name" {
  type        = string
  description = "The name of the ECS cluster"
}

variable "service_name" {
  type        = string
  description = "The name of the ECS service"
}

variable "container_name" {
  type        = string
  description = "The name of the container"
}

variable "container_port" {
  type        = number
  description = "The port the container listens on"
}

variable "security_group_name_ecs_lb" {
  type        = string
  description = "The name of the security group"
}

