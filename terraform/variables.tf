#Specifying the region for Azure resources

variable "azure_region" {
  description = "Azure region for resources"
  default     = "East US"
}

#To store the name of the Azure Container Registry (ACR)

variable "acr_name" {
  description = "Azure Container Registry name"
}

#To specify the name of the Azure Kubernetes Service (AKS) cluster

variable "aks_name" {
  description = "Azure Kubernetes Service cluster name"
}
