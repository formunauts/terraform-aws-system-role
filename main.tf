provider "aws" {
  version = "~> 2.19.0"
}

terraform {
  backend "s3" {}
}

module "label" {
  source    = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.4.0"
  enabled   = var.enabled
  namespace = var.namespace
  stage     = var.stage
  name      = var.name
}

data "aws_iam_policy_document" "default" {
  statement {
    action = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
    }

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = [true]
    }
  }
}

resource "aws_iam_role" "default" {
  count = var.enabled == true ? 1 : 0

  name               = var.role_name == "" ? module.label.name : var.role_name
  description        = "Managed by Terraform"
  assume_role_policy = data.aws_iam_role_policy_document.default.json
  tags               = module.label.tags
}

resource "aws_iam_policy_attachment" "default" {
  count = var.enabled == true ? 1 : 0

  name       = join("", aws_iam_role.default.*.name)
  roles      = aws_iam_role.default.*.name
  policy_arn = var.policy_arns
}
