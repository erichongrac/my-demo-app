# GitHub provider config
provider "github" {
  token = var.github_token
  owner = var.github_owner
}

# Azure provider config
provider "azurerm" {
  features {}
}
