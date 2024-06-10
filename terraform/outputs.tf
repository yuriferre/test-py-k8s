output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs.id
}

# output "alb_security_group_id" {
#   value = aws_security_group.alb.id
# }

output "ecs_service_name" {
  value = aws_ecs_service.main.name
}

# output "target_group_arn" {
#   value = aws_lb_target_group.main.arn
# }

# output "alb_dns_name" {
#   value = aws_lb.main.dns_name
# }

output "execution_role_arn" {
  value = aws_iam_role.execution_role.arn
}