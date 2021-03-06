variable "project_name" {
  type        = string
  description = "The project name is tha base for all other names"
  default     = "my_project"
}

# Azure region
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "westeurope"
}