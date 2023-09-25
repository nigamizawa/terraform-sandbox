locals {
  profile = "TODO"

  defaults = {
    region = "ap-northeast-1"
    tags = {
      "Environment"    = terraform.workspace
      "Managed_by"     = "Terraform"
      "Repository"     = "nigamizawa/terraform-sandbox"
      "Repository_url" = "https://github.com/nigamizawa/terraform-sandbox"
    }
  }
}
