data "aws_ssoadmin_instances" "this" {}

locals {
  ssoadmin_instances_this = data.aws_ssoadmin_instances.this
  instance_arn            = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  identity_store_id       = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
}
