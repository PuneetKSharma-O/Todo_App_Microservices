terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "monotodostg1234"
    resource_group_name = "todo-rg"
    container_name = "todo-cnt"
    key = "dev.todomicro.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "470e0441-3f52-4fdf-8fc5-508cd114ccbc"
}
