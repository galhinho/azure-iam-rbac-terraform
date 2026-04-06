resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = local.env
    project     = "iam"
    owner       = local.prefix
  }
}

data "azurerm_client_config" "current" {}