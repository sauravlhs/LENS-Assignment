provider "azurerm" {
  features {}
}

provider "azuread" {}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "East US"
}

# Azure Container Registry
resource "azurerm_container_registry" "example" {
  name                     = "exampleacr"
  resource_group_name       = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  sku                       = "Basic"
  admin_enabled            = true
}

# Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks-cluster"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2S_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "Dev/Test"
  }

  
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "example" {
  name                = "example-log-analytics-workspace"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "PerGB2018"
}
