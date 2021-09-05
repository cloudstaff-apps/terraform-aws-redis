resource "aws_security_group" "redis" {
  name   = "redis-${var.environment_name}-${var.name}"
  vpc_id = var.vpc_id

  tags = {
    Name = "redis-${var.environment_name}-${var.name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "redis_inbound_cidrs" {
  count             = length(var.allow_cidrs) != 0 ? 1 : 0
  type              = "ingress"
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
  cidr_blocks       = var.allow_cidrs
  security_group_id = aws_security_group.redis.id
  description       = "From CIDR ${join(", ", var.allow_cidrs)}"
}

resource "aws_security_group_rule" "redis_inbound_sg" {
  count                    = length(var.allow_security_group_ids)
  type                     = "ingress"
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "tcp"
  source_security_group_id = var.allow_security_group_ids[count.index]
  security_group_id        = aws_security_group.redis.id
  description              = "Allow access"
}

resource "aws_security_group_rule" "outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.redis.id
  cidr_blocks       = ["0.0.0.0/0"]
}