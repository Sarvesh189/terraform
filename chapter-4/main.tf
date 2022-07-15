terraform {
  required_providers {
    azurermch ={
        source="hashicorp/azurerm"
        version="3.0.0"
    }
  }
}

provider "azurermch" {
    features{}
}

resource "azurerm_resource_group" "web_server_rg"{
    provider = azurermch
    name= var.web_server_rg
    location = var.web_server_location
}

resource "azurerm_virtual_network" "web_server_net" {
    provider = azurermch
    name="${var.resource_prefix}-vnet"
    location = var.web_server_location
    resource_group_name = azurerm_resource_group.web_server_rg.name
    address_space = [var.web_server_address_space]
}

resource "azurerm_subnet" "web_server_subnet" {
    provider = azurermch
   name="${var.resource_prefix}-subnet"
   resource_group_name = azurerm_resource_group.web_server_rg.name
   virtual_network_name = azurerm_virtual_network.web_server_net.name
   address_prefixes = [var.web_server_address_prefix]
}