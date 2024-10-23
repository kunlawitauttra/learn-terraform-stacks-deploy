# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# variable "regions" {
#   type = set(string)
# }
variable "regions" {
  description = "List of regions to create VPC and Subnets"
  type        = list(string)
  default     = ["us-east-1", "us-west-1"]  # ตัวอย่าง regions
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
  default     = ["10.0.0.0/20", "10.1.0.0/20"]
}

variable "subnet_cidr_blocks" {
  description = "Map of regions to their list of Subnet CIDR blocks"
  type        = map(list(string))
  default     = {
    "us-east-1" = ["10.0.1.0/24", "10.0.2.0/24"],
    "us-west-1" = ["10.1.1.0/24", "10.1.2.0/24"]
  }
}

