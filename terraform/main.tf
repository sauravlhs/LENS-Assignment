# Configuring the Azure Provider with the required features
provider "azurerm" {
  features {}
}

# Configuring the Azure Active Directory Provide
provider "azuread" {}

# Resource Group
resource "azurerm_resource_group" "assignment" {
  name     = "LensAssignment"                                                 # Name of the resource group
  location = "East US"                                                        # Region where the resource group will be located
}

# Azure Container Registry
resource "azurerm_container_registry" "example" {
  name                     = "LensAssignment"                                 # Name of the Azure Container Registry
  resource_group_name       = azurerm_resource_group.assignment.name          # Reference to the resource group
  location                 = azurerm_resource_group.assignment.location       # Region for the ACR
  sku                       = "Basic"
  admin_enabled            = true                                             # To enable admin user for the ACR login
}

# Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "assignment" {
  name                = "AssignmentLens"                                      # Name of the AKS cluster
  location            = azurerm_resource_group.assignment.location            # Region for the AKS cluster
  resource_group_name = azurerm_resource_group.assignment.name                # Resource group for the AKS cluster
  dns_prefix          = "assignmentleaks"                                     # DNS prefix for the AKS cluster

  default_node_pool {
    name       = "basic"                                                      # Name of the basic node pool
    node_count = 2                                                            # Number of nodes in the basic node pool
    vm_size    = "Standard_D2S_v3"                                            # VM size for each node in the pool
  }

  identity {
    type = "SystemAssigned"                                                   # Automatically managed identity for the AKS cluster
  }

  tags = {
    environment = "Dev/Test"                                                  # Label to indicate environment
  }

  
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "logs" {
  name                = "LensAssignment-logs"                                 # Name of the Log Analytics workspace
  location            = azurerm_resource_group.logs.location                  # Location for the workspace
  resource_group_name = azurerm_resource_group.logs.name                      # Resource group for the workspace
  sku                 = "PerGB2018"                                           # Pricing tier for Log Analytics workspace
}
