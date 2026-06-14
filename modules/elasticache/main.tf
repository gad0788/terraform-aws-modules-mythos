resource "aws_elasticache_cluster" "main" {
  cluster_id           = var.cluster_id
  engine               = var.engine
  node_type           = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  port                 = var.port
  subnet_group_name    = var.create_subnet_group ? aws_elasticache_subnet_group.main[0].name : var.subnet_group_name

  security_group_ids  = [aws_security_group.elasticache.id]

  notification_topic_arn = var.notification_topic_arn

  tags = merge(var.tags, {
    Name = var.cluster_id
  })
}

resource "aws_security_group" "elasticache" {
  name        = "${var.cluster_id}-sg"
  description = "Security group for ElastiCache"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.port
    to_port         = var.port
    protocol        = "tcp"
    security_groups = var.allowed_security_groups
    cidr_blocks     = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.cluster_id}-sg"
  })
}

resource "aws_elasticache_subnet_group" "main" {
  count          = var.create_subnet_group ? 1 : 0
  name           = "${var.cluster_id}-subnet-group"
  subnet_ids     = var.subnet_ids

  tags = merge(var.tags, {
    Name = "${var.cluster_id}-subnet-group"
  })
}
