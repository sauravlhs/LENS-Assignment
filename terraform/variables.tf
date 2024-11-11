# Define variables
variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "example-resources"
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
