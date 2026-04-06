terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstate12345gmlab"
    container_name       = "tfstate"
    key                  = "iam.terraform.tfstate"

    use_azuread_auth = true
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

