resource "aws_config_configuration_aggregator" "main" {
  count = var.create_config_aggregator ? 1 : 0
  name  = "${var.environment}-config-aggregator"

  account_aggregation_source {
    account_ids = var.aggregator_account_ids
    regions     = var.aggregator_regions
  }

  tags = merge(var.tags, {
    Name = "${var.environment}-config-aggregator"
  })
}

resource "aws_config_config_rule" "main" {
  count       = length(var.config_rules)
  name        = var.config_rules[count.index].name
  description = var.config_rules[count.index].description

  source {
    owner             = "AWS"
    source_identifier = var.config_rules[count.index].source_identifier
  }

  scope {
    compliance_resource_types = var.config_rules[count.index].compliance_resource_types
  }

  depends_on = [aws_config_configuration_recorder.main]

  tags = merge(var.tags, {
    Name = var.config_rules[count.index].name
  })
}

resource "aws_config_configuration_recorder" "main" {
  name       = "${var.environment}-recorder"
  role_arn   = aws_iam_role.config.arn
  depends_on = [aws_iam_role_policy_attachment.config]

  recording_group {
    all_supported = true
  }
}

resource "aws_config_configuration_recorder_status" "main" {
  name       = aws_config_configuration_recorder.main.name
  is_enabled = var.enable_recorder
  depends_on = [aws_config_delivery_channel.main]
}

resource "aws_config_delivery_channel" "main" {
  name             = "${var.environment}-delivery-channel"
  s3_bucket_name   = aws_s3_bucket.config.id
  s3_key_prefix    = var.s3_key_prefix
  depends_on       = [aws_config_configuration_recorder.main, aws_s3_bucket_policy.config]
}

resource "aws_s3_bucket" "config" {
  bucket = var.config_bucket_name

  tags = merge(var.tags, {
    Name = var.config_bucket_name
  })
}

resource "aws_s3_bucket_policy" "config" {
  bucket = aws_s3_bucket.config.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid    = "AWSConfigBucketPermissionsCheck"
      Effect = "Allow"
      Principal = {
        Service = "config.amazonaws.com"
      }
      Action   = "s3:GetBucketVersioning"
      Resource = aws_s3_bucket.config.arn
    },
    {
      Sid    = "AWSConfigBucketDelivery"
      Effect = "Allow"
      Principal = {
        Service = "config.amazonaws.com"
      }
      Action   = "s3:PutObject"
      Resource = "${aws_s3_bucket.config.arn}/*"
    }]
  })
}

data "aws_iam_policy_document" "config_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "config" {
  name               = "${var.environment}-config-role"
  assume_role_policy = data.aws_iam_policy_document.config_assume_role.json
}

resource "aws_iam_role_policy_attachment" "config" {
  role       = aws_iam_role.config.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/ConfigRole"
}
