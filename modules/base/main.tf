locals {
  base_rg_name = format("%s_base_rg", var.project_name)
}

resource "azurerm_resource_group" "base-rg" {
  name     = local.base_rg_name
  location = var.location

  tags = {
    Environment = "Terraform Getting Started"
    Team = "DevOps"
    }
}