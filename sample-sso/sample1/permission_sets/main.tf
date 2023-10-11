locals {
  default_session_duration = "PT4H"
}

module "hogePermissionSets" {
  source = "./hoge"
}
