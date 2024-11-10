variable "azure_region" {
  description = "Azure region for resources"
  default     = "East US"
}

variable "acr_name" {
  description = "Azure Container Registry name"
}

variable "aks_name" {
  description = "Azure Kubernetes Service cluster name"
}
