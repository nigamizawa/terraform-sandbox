locals {
  hoge = {
    prod = {
      AdminAccess = {
        arn = module.permissions.this.AdministratorAccess.arn
        groups = {
          Sre = local.groups.Sre
        }
      }
      DeveloperAccess = {
        arn = module.permissions.this.readonly.arn
        groups = {
          guest = local.groups.guest
        }
      }
    }
    stg = {
      AdminAccess = {
        arn = module.permissions.this.AdministratorAccess.arn
        groups = {
          Sre = local.groups.Sre
        }
      }
      DeveloperAccess = {
        arn = module.permissions.hoge.DeveloperAccess.arn
        groups = {
          Dev = local.groups.Dev
          Sre = local.groups.Sre
        }
      }
      ReadOnly = {
        arn = module.permissions.this.readonly.arn
        groups = {
          guest = local.groups.guest
        }
      }
    }
  }
}

module "hoge_prod" {
  for_each = local.hoge.prod
  source   = "./account_permission_assignment"

  account_id         = "000000000000" #12桁
  permission_set_arn = each.value.arn
  groups             = each.value.groups
}

module "hoge_stg" {
  for_each = local.hoge.stg
  source   = "./account_permission_assignment"

  account_id         = "000000000000" #12桁
  permission_set_arn = each.value.arn
  groups             = each.value.groups
}

module "hoge_dev" {
  for_each = local.hoge.stg #stgと権限がまった同じ
  source   = "./account_permission_assignment"

  account_id         = "000000000000" #12桁
  permission_set_arn = each.value.arn
  groups             = each.value.groups
}
