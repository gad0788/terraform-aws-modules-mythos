resource "aws_sqs_queue" "main" {
  name                      = var.queue_name
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  kms_master_key_id         = var.kms_key_id

  tags = merge(var.tags, {
    Name = var.queue_name
  })
}

resource "aws_sqs_queue_redrive_policy" "main" {
  count            = var.create_dlq ? 1 : 0
  queue_url        = aws_sqs_queue.main.id
  redrive_policy   = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
    maxReceiveCount     = var.max_receive_count
  })
}

resource "aws_sqs_queue" "dlq" {
  count           = var.create_dlq ? 1 : 0
  name            = "${var.queue_name}-dlq"
  kms_master_key_id = var.kms_key_id

  tags = merge(var.tags, {
    Name = "${var.queue_name}-dlq"
  })
}
