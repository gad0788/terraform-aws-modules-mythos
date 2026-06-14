resource "aws_sns_topic" "main" {
  name                        = var.topic_name
  display_name               = var.display_name
  kms_master_key_id          = var.kms_key_id
  content_based_deduplication = var.content_based_deduplication

  tags = merge(var.tags, {
    Name = var.topic_name
  })
}

resource "aws_sns_topic_subscription" "main" {
  count     = length(var.subscriptions)
  topic_arn = aws_sns_topic.main.arn
  protocol  = var.subscriptions[count.index].protocol
  endpoint  = var.subscriptions[count.index].endpoint
}

resource "aws_sns_topic_policy" "main" {
  count  = var.create_topic_policy ? 1 : 0
  arn    = aws_sns_topic.main.arn
  policy = var.topic_policy
}
