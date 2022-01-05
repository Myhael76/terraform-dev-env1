# Azure region
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "westeurope"
}

