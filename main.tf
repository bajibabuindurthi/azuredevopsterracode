provider "azurerm" {
  features {}

  client_id       = "b329aa9b-3e27-4798-a30c-4181f9201406"
  client_secret   = "wId8Q~bGt4wGeBKpcMKstW1vixswXB3yUmQSHcV5"
  tenant_id       = "e2f8cd1b-a228-450b-aa16-6618918130b2"
  subscription_id = "fc268311-65d9-4a95-990a-bb9df54f014c"
}

resource "azurerm_resource_group" "rg" {
  name     = var.azurerm_resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_subnet" "subnet01" {
  name                 = var.azurerm_subnet1_name
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes1
  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "subnet02" {
  name                 = var.azurerm_subnet2_name
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes2
  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet" "subnet03" {
  name                 = var.azurerm_subnet3_name
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = var.azurerm_virtual_network_name
  address_prefixes     = var.address_prefixes3
  depends_on = [azurerm_virtual_network.vnet]
}