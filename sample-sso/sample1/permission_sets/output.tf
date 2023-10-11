# thisじゃなくて、commonとかでもいいかも
output "this" {
  value = {
    AdministratorAccess = aws_ssoadmin_permission_set.AdministratorAccess
    ReadOnly            = aws_ssoadmin_permission_set.ReadOnly
  }
}

output "hoge" {
  value = module.hogePermissionSets.this
}
# hoge.DeveloperAccess みたいな感じで取得できる
