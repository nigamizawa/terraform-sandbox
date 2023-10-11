data "aws_ssoadmin_instances" "this" {}

locals {
  ssoadmin_instances_this = data.aws_ssoadmin_instances.this
  instance_arn            = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  identity_store_id       = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
}

data "aws_identitystore_group" "group" {
  for_each          = var.groups
  identity_store_id = local.identity_store_id

  filter {
    attribute_path  = "DisplayName"
    attribute_value = each.value.description
  }
}

resource "aws_ssoadmin_account_assignment" "group" {
  for_each = data.aws_identitystore_group.group

  instance_arn       = local.instance_arn
  permission_set_arn = var.permission_set_arn

  principal_id   = each.value.group_id
  principal_type = "GROUP"

  target_id   = var.account_id
  target_type = "AWS_ACCOUNT"
}
