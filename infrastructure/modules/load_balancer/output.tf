output "lb_arn" {
  value = aws_lb.this.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.this.arn
}

output "elb_zone_id" {
  value = aws_lb.this.zone_id
}

output "elb_dns_name" {
  description = "DNS name of the Elastic Load Balancer"
  value       = aws_lb.this.dns_name 
}