# awsがあらかじめ用意しているmanaged policyを利用しないケース
resource "aws_ssoadmin_permission_set" "DeveloperAccess" {
  instance_arn     = local.instance_arn
  name             = "DeveloperAccess"
  description      = "Hoge account Developer permission set"
  session_duration = local.default_session_duration
}

resource "aws_ssoadmin_customer_managed_policy_attachment" "DeveloperAccess" {
  instance_arn       = local.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.DeveloperAccess.arn
  customer_managed_policy_reference {
    name = aws_iam_policy.DeveloperAccess.name
    path = "/" #default
  }
}

resource "aws_iam_policy" "DeveloperAccess" {
  name        = "HogeAccountDeveloperAccessPolicy"
  description = "developer access policy for hoge account"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action = [
          "s3:*",
          "ec2:Describe*",
        ]
        Resource = "*"
      },
    ]
  })
}
