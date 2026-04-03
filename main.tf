terraform {
	required_providers {
		azurerm = {
			source 	= "hashicorp/azurerm"
			version = "~> 3.0"
		}
		azuread = {
			source 	= "hashicorp/azuread"
			version = "~> 2.0"
		}
	}
}

provider "azurerm" {
	features {}
}

resource "azurerm_resource_group" "rg" {
	name = var.resource_group_name
	location = var.location
}

resource "azurerm_storage_account" "storage" {
	name						= "stiamdemo12345"
	resource_group_name 		= var.resource_group_name
	location 					= var.location
	account_tier 				= "Standard"
	account_replication_type	= "LRS"
}

resource "azuread_application" "app" {
	display_name 				= "iam-demo-app"
}

resource "azuread_service_principal" "sp" {
	client_id = azuread_application.app.client_id
}

resource "azurerm_role_assignment" "sp_role" {
	scope 						= azurerm_resource_group.rg.id
	role_definition_name		= "Reader"
	principal_id				= azuread_service_principal.sp.object_id
}

data "azurerm_client_config" "current" {}

