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

variable "subnet_cidr_block" {
  description = "CIDR block size for subnets"
  type        = number
  default     = 24
}

