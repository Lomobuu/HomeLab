terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.33.0"
    }
      random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
    
  }
  backend "azurerm" {
    resource_group_name  = "Homelab-management-RG"
    storage_account_name = "tfstatehomelabfozzen"       # static name
    container_name       = "tfstate-${var.environment}"       # auto replaced
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  use_oidc = true
  skip_provider_registration = true
}

data "azurerm_client_config" "ServicePrincipal" {
}

data "azurerm_resource_group" "rg" {
  name = "homelab-${var.environment}-RG"
}