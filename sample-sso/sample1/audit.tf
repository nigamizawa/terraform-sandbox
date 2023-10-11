locals {
  audit = {
    AdminAccess = {
      arn = module.permissions.this.AdministratorAccess.arn
      groups = {
        Sre = local.groups.Sre
      }
    }
  }
}

module "audit" {
  for_each = local.audit
  source   = "./account_permission_assignment"

  account_id         = "000000000000" #12桁
  permission_set_arn = each.value.arn
  groups             = each.value.groups
}
