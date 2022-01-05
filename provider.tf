# define terraform provider
terraform {
  required_version = ">= 1.0.0"
}

# configure the azure provider
provider "azurerm" { 
  features {}
  #environment     = "public"
  #subscription_id = var.azure-subscription-id
  #tenant_id       = var.azure-tenant-id
}
