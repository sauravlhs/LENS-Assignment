# Provider configuration
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Resource Group
resource "azurerm_resource_group" "LensAssignment" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "lens_vnet" {
  name                = "lensVNet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.LensAssignment.name
}

# Subnet
resource "azurerm_subnet" "lens_subnet" {
  name                 = "lensSubnet"
  resource_group_name  = azurerm_resource_group.LensAssignment.name
  virtual_network_name = azurerm_virtual_network.lens_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Interface
resource "azurerm_network_interface" "lens_nic" {
  name                = "lensNIC"
  location            = var.location
  resource_group_name = azurerm_resource_group.LensAssignment.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.lens_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Virtual Machine
resource "azurerm_linux_virtual_machine" "lens_vm" {
  name                = "lensVM"
  resource_group_name = azurerm_resource_group.LensAssignment.name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.lens_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

# Storage Account
resource "azurerm_storage_account" "lens_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.LensAssignment.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Storage Container
resource "azurerm_storage_container" "lens_container" {
  name                  = "lenscontainer"
  storage_account_name  = azurerm_storage_account.lens_storage.name
  container_access_type = "private"
}
