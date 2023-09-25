resource "aws_sfn_state_machine" "update_securityhub_status" {
  name     = "update_securityhub_status_to_notified"
  role_arn = aws_iam_role.iam_for_sfn.arn

  definition = templatefile("${path.module}/sfn_templates/update_securityhub_status_to_notified.josn", )
}

# todo: role作成
