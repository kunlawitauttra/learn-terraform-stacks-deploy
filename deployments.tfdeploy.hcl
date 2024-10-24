# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    regions        = ["us-east-1"]
    vpc_cidr_blocks = ["10.0.0.0/16"]
    role_arn       = "arn:aws:iam::650251707042:role/stacks-kunlawit-organization-Learn-Terraform-Stacks-deployments"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "production" {
  inputs = {
    regions        = ["us-east-1", "us-west-1"]
    vpc_cidr_blocks = ["10.0.0.0/16", "10.1.0.0/16"]
    role_arn       = "arn:aws:iam::650251707042:role/stacks-kunlawit-organization-Learn-Terraform-Stacks-deployments"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}

deployment "test" {
  inputs = {
    regions        = ["us-east-1"]
    vpc_cidr_blocks = ["10.0.0.0/16"]
    role_arn       = "arn:aws:iam::650251707042:role/stacks-kunlawit-organization-Learn-Terraform-Stacks-deployments"
    identity_token = identity_token.aws.jwt
    default_tags   = { stacks-preview-example = "lambda-component-expansion-stack" }
  }
}