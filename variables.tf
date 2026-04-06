variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "env" {
  description = "Environment name (dev, test, prod)"
  type        = string
}