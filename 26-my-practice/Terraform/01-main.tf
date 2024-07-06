terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.108.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
  backend "azurerm" {
    resource_group_name  = "state_rg"
    storage_account_name = "statefilestorageaks"
    container_name       = "blob"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "random" {}

resource "random_pet" "aksrandom" {

}
