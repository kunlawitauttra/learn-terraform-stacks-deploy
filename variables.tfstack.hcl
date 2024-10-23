# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "regions" {
  type = set(string)
}

variable "identity_token" {
  type      = string
  ephemeral = true
}

variable "role_arn" {
  type = string
}

variable "default_tags" {
  description = "A map of default tags to apply to all AWS resources"
  type        = map(string)
  default     = {}
}

variable "vpc_cidr_blocks" {
  description = "Map of regions to their VPC CIDR blocks"
  type        = map(string)
  default     = {
    "us-east-1"     = "10.0.0.0/20"
    "ap-southeast-1" = "10.1.0.0/20"
  }
}

variable "subnet_cidr_blocks" {
  description = "Map of regions to their list of Subnet CIDR blocks"
  type        = map(list(string))
  default     = {
    "us-east-1" = ["10.0.1.0/24", "10.0.2.0/24"],
    "ap-southeast-1" = ["10.1.1.0/24", "10.1.2.0/24"]
  }
}


