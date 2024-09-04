variable "cluster_name" {
  type        = string
  description = "The name of the ECS cluster"
}

variable "service_name" {
  type        = string
  description = "The name of the ECS service"
}

variable "task_definition" {
  type        = string
  description = "The ECS task definition to use"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the service"
}

variable "security_group_id" {
  type        = string
  description = "The ID of the security group"
}

variable "target_group_arn" {
  type        = string
  description = "The ARN of the target group"
}

variable "container_name" {
  type        = string
  description = "The name of the container"
}

variable "container_port" {
  type        = number
  description = "The port the container listens on"
}
