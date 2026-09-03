terrafrom {
    required_providers{
       azurerm = {
        source ="hashicorp/azurem"
        version = "~>5.0.0"
        }
    }
}

provider "azurerm"{
    features{}
}

resource "azurerm_resource_group" "rg1" {
    name= "rg"
    location = "eastus"
}