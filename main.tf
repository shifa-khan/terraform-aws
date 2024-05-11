terraform {
  required_version = ">= 0.12"
}

# CONFIGURE OUR AWS CONNECTION

provider "aws" {}

# CREATE THE S3 BUCKET

data "aws_caller_identity" "current" {}

locals {
  account_id    = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket" "terraform_state" {
  # With account id, this S3 bucket names can be *globally* unique.
  bucket = "${local.account_id}-terraform-states"

  # Enable versioning so we can see the full revision history of our
  versioning {
    enabled = true
  }
