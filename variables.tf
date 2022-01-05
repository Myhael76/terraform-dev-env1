# Azure region
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "westeurope"
}
variable "azure-subscription-id" {
  type        = string
  description = "Subscription that should receive the deployment"
  default     = ""
}
