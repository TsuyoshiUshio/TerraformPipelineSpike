provider "azurerm" {
  subscription_id = var.subscription_id
  version           = "~>1.44" 
}

terraform {
  backend "azurerm" {

  }
}
