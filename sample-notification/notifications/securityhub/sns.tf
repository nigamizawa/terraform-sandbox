locals {
  subscriptions = {
    pagerduty = {
      endpoint = ""
    }
    email = {}
  }
}

resource "aws_sns_topic" "main" {
  name = "${var.name}-events"
}

resource "aws_sns_topic_subscription" "pagerduty" {
  topic_arn = aws_sns_topic.name.arn
  protocol  = "http" #https?
  endpoint  = local.pagerduty.endpoint
}

resource "aws_sns_topic_policy" "main" {
  arn    = aws_sns_topic.main.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}



data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    sid    = "sid_1"
    effect = "Allow"
    actions = [
      "sns:Subscribe",
      "sns:SetTopicAttributes",
      "sns:RemovePermission",
      "sns:Receive",
      "sns:Publish",
      "sns:ListSubscriptionsByTopic",
      "sns:GetTopicAttributes",
      "sns:DeleteTopic",
      "sns:AddPermission",
    ]
    resources = [aws_sns_topic.main.arn]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceOwner"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
  statement {
    sid       = "sid_2"
    effect    = "Allow"
    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.main.arn]
    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}
