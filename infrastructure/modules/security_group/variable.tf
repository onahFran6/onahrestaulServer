variable "security_group_name" {
  type        = string
  description = "The name of the security group"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}



variable "security_group_name_ecs_lb" {
  type        = string
  description = "The name of the security group"
}