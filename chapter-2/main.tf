terraform {
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version="3.0.0"
  }
  }
  
}

provider "azurerm" {
    features {     
    }
  
}

resource "azurerm_resource_group" "web_server_rg" {
    name = var.web_server_rg
    location=var.web_server_location
  
}