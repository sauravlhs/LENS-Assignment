# Define variables

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "client_id" {
  description = "The Azure client ID"
  type        = string
}

variable "client_secret" {
  description = "The Azure client secret"
  type        = string
}

variable "tenant_id" {
  description = "The Azure tenant ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "LensAssignment"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}


variable "storage_account_name" {
  description = "Unique name for the Azure storage account"
  type        = string
  default     = "examplestoracc123"
}
