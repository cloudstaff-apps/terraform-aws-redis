resource "aws_ssm_parameter" "redis_endpoint" {
  name        = "/${var.environment_name}/${var.name}/redis/ENDPOINT"
  description = "Redis Endpoint"
  type        = "String"
  value       = aws_elasticache_replication_group.redis.primary_endpoint_address
}

resource "aws_ssm_parameter" "redis_password" {
  count       = var.transit_encryption_enabled ? 1 : 0
  name        = "/${var.environment_name}/${var.name}/redis/PASSWORD"
  description = "Redis Password"
  type        = "SecureString"
  # value       = var.auth_token != null ? var.auth_token : random_string.redis_password[0].result
  value = random_string.redis_password[0].result

  lifecycle {
    ignore_changes = [value]
  }
}
