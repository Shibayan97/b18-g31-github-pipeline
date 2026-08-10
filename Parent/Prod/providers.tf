terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-shibayan"
    storage_account_name = "stgaccountpaul97"
    container_name       = "backendcontainer"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
