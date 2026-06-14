resource "aws_cloudwatch_log_group" "main" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id

  tags = merge(var.tags, {
    Name = var.log_group_name
  })
}

resource "aws_cloudwatch_metric_alarm" "main" {
  count                     = length(var.alarms)
  alarm_name                = var.alarms[count.index].name
  comparison_operator       = var.alarms[count.index].comparison_operator
  evaluation_periods        = var.alarms[count.index].evaluation_periods
  metric_name              = var.alarms[count.index].metric_name
  namespace                = var.alarms[count.index].namespace
  period                   = var.alarms[count.index].period
  statistic                = var.alarms[count.index].statistic
  threshold                = var.alarms[count.index].threshold
  alarm_description        = var.alarms[count.index].alarm_description
  alarm_actions            = var.alarms[count.index].alarm_actions
  ok_actions               = var.alarms[count.index].ok_actions
  insufficient_data_actions = var.alarms[count.index].insufficient_data_actions

  tags = merge(var.tags, {
    Name = var.alarms[count.index].name
  })
}

resource "aws_cloudwatch_dashboard" "main" {
  count          = var.create_dashboard ? 1 : 0
  dashboard_name = var.dashboard_name

  dashboard_body = jsonencode({
    widgets = var.dashboard_widgets
  })
}
