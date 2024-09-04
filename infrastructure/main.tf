
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source                = "./modules/vpc"
  vpc_name              = var.vpc_name
  cidr_block            = var.cidr_block
  public_subnet_count   = var.public_subnet_count
  public_subnet_cidrs   = var.public_subnet_cidrs
  availability_zones    = var.availability_zones
}

module "security_group" {
  source                      = "./modules/security_group"
  security_group_name         = var.security_group_name
  security_group_name_ecs_lb  = var.security_group_name_ecs_lb
  vpc_id                      = module.vpc.vpc_id
}

module "load_balancer" {
  source                = "./modules/load_balancer"
  lb_name               = var.lb_name
  security_group_id     = module.security_group.ecs_sg_id
  subnet_ids            = module.vpc.public_subnet_ids
  vpc_id                = module.vpc.vpc_id
  target_group_name     = var.target_group_name
}


module "ecs_task_definition" {
  depends_on            = [module.load_balancer]
  source                 = "./modules/ecs_task_definition"
  family                 = var.family
  container_definitions  = var.container_definitions
  cpu                    = var.cpu
  memory                 = var.memory
  execution_role_arn     = var.execution_role_arn
  task_role_arn          = var.task_role_arn
}

module "ecs_cluster" {
  depends_on            = [module.ecs_task_definition]
  source                = "./modules/ecs_cluster"
  cluster_name          = var.cluster_name
  service_name          = var.service_name
  task_definition       = module.ecs_task_definition.task_definition_arn
  subnet_ids            = module.vpc.public_subnet_ids
  security_group_id     = module.security_group.ecs_lb_sg_id
  target_group_arn      = module.load_balancer.target_group_arn
  container_name        = var.container_name
  container_port        = var.container_port
}
