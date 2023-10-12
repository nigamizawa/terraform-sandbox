module "permission_sets" {
  source = "./permission_sets"
}

module "accounts" {
  source = "./accounts"
  permission_sets = module.permission_sets
}
