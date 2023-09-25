provider "aws" {
  region  = local.defaults.region
  profile = local.profile
  default_tags {
    tags = local.defaults.tags
  }
}
