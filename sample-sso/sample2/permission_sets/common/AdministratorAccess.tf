resource "aws_ssoadmin_permission_set" "AdministratorAccess" {
  instance_arn     = local.instance_arn
  name             = "AdministratorAccess"
  description      = "AdministratorAccess permission set"
  session_duration = local.default_session_duration
}

resource "aws_ssoadmin_managed_policy_attachment" "AdministratorAccess" {
  instance_arn       = local.instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.AdministratorAccess.arn
}
