#Create Resource Group and destroy

terraform {
  required_providers {
    azurerm = {
        source ="hashicorp/azurerm"
        version="3.0.0"
    }
  }
}

provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "web_server_rg" {
  name = "web_reg_su"
  location = "westus2"
}