resource "aws_ssoadmin_permission_set" "ReadOnly" {
  instance_arn     = local.instance_arn
  name             = "ReadOnlyAccess"
  description      = "ReadOnly permission set"
  session_duration = local.default_session_duration
}

resource "aws_ssoadmin_managed_policy_attachment" "ReadOnly" {
  instance_arn       = local.instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.ReadOnly.arn
}
