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
  description = "List of VPC CIDR blocks matching the order of regions"
  type        = list(string)
}

