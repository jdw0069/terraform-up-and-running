resource "aws_cloudwatch_metric_alarm" "billing" {
  alarm_name                = "billing-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "EstimatedCharges"
  namespace                 = "AWS/Billing"
  period                    = "28800"
  statistic                 = "Maximum"
  threshold                 = "1"
  alarm_actions             = ["${aws_sns_topic.sns_alert_topic.arn}"]

  dimensions = {
      Currency = "USD"
  }
}

resource "aws_sns_topic" "sns_alert_topic" {
    name = "billing-alarm-notification"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.sns_alert_topic.arn 
  protocol  = "email"
  endpoint  = var.email
}

variable "email" {
    type = string
}


