# GitHub provider config
provider "github" {
  token = var.github_token
  owner = var.github_owner
}

# Azure provider config
provider "azurerm" {
  features {}
  
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
}
