resource "aws_ssm_parameter" "redis_endpoint" {
  name        = "/redis/${var.environment_name}-${var.name}/ENDPOINT"
  description = "Redis Endpoint"
  type        = "String"
  value       = aws_elasticache_replication_group.redis.primary_endpoint_address
}

resource "aws_ssm_parameter" "redis_password" {
  count       = var.transit_encryption_enabled ? 1 : 0
  name        = "/redis/${var.environment_name}-${var.name}/PASSWORD"
  description = "Redis Password"
  type        = "SecureString"
  value       = var.auth_token != null ? var.auth_token : random_string.redis_password[0].result

  lifecycle {
    ignore_changes = [value]
  }
}