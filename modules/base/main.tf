locals {
  base_rg_name = format("%s_base_rg", var.project_name)
  base_storage_name = lower(replace(format("%s_base_storage", var.project_name),"_",""))
  vnet_name = format("%s_vnet", var.project_name)
  snet_name = format("%s_snet", var.project_name)
}

resource "azurerm_resource_group" "base-rg" {
  name     = local.base_rg_name
  location = var.location

  tags = {
    Environment = "Terraform Getting Started"
    Team = "DevOps"
    }
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = local.base_rg_name
}

resource "azurerm_subnet" "subnet" {
  name                 = local.snet_name
  resource_group_name  = local.base_rg_name
  virtual_network_name = local.vnet_name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
}
resource "azurerm_storage_account" "example" {
  name                = local.base_storage_name
  resource_group_name = local.base_rg_name

  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.subnet.id]
  }
}