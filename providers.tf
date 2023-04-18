terraform {
  required_providers {
    azurerm = {
      version = "~> 3.52.0"
    }
  }
}

# Azure Resource Manager provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}