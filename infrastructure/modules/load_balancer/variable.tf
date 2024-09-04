variable "target_group_name" {
  type        = string
  description = "The name of the target group"
}

variable "lb_name" {
  type        = string
  description = "The name of the Load Balancer"
}

variable "security_group_id" {
  type        = string
  description = "The ID of the security group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the Load Balancer"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}


