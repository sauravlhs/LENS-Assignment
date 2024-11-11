# Define the Azure Subscription ID for authentication
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

# Azure Client ID for the Service Principal
variable "client_id" {
  description = "The Azure client ID"
  type        = string
}

# Azure Client Secret for the Service Principal
variable "client_secret" {
  description = "The Azure client secret"
  type        = string
}

# Azure Tenant ID for the Active Directory
variable "tenant_id" {
  description = "The Azure tenant ID"
  type        = string
}

# Azure Resource Group name for deploying resources
variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "LensAssignment"
}


# Define region where resources will be created
variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

# Azure Storage Account name
variable "storage_account_name" {
  description = "Unique name for the Azure storage account"
  type        = string
  default     = "lensacc123"
}
