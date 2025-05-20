# GitHub provider config
provider "github" {
  token = var.github_token
  owner = var.github_owner
}

provider "azurerm" {
  features = {}
}
