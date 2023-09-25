locals {
  event_targets = {
    sns_topic = {
      arn  = aws_sns_topic.main.arn
    }
    step_function = {
      arn  = ""
    }
  }
}

resource "aws_cloudwatch_event_rule" "main" {
  for_each = local.event_patterns

  name          = "${var.name}-${each.key}"
  event_pattern = templatefile("${path.module}/eventbridge_templates/securityhub.tf")
}

resource "aws_cloudwatch_event_target" "main" {
  for_each = local.event_targets

  arn  = each.value.arn
  rule = aws_cloudwatch_event_rule.main.name
}
