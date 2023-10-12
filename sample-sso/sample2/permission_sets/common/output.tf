output "this" {
  value = {
    AdministratorAccess = aws_ssoadmin_permission_set.AdministratorAccess
    ReadOnly            = aws_ssoadmin_permission_set.ReadOnly
  }
}
