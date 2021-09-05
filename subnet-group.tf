resource "aws_elasticache_subnet_group" "redis" {
  count      = var.create_subnet_group ? 1 : 0
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = subnet_name
  }
}