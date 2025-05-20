# Terraform config for GitHub resources
resource "github_repository" "demo_repo" {
  name         = "terraform-managed-repo"
  description  = "This repo is managed by Terraform"
  visibility   = "private"
  auto_init    = true
}
/*
resource: Declares you're managing a GitHub resource.
"github_repository": Type of resource (a GitHub repo).
"demo_repo": Internal Terraform name for this resource.

Inside:
name: The name of the repo on GitHub.
description: Shows up under the repo name in GitHub.
visibility: Set to "private" (others can't see it).
auto_init: If true, GitHub will auto-create a README when initializing the repo.
*/

resource "github_actions_secret" "api_key" {
  repository       = github_repository.demo_repo.name
  secret_name      = "API_KEY"
  plaintext_value  = "supersecretapikey123"
}

/*
This creates a GitHub Actions secret called API_KEY inside the repo created above.

Key attributes:
repository: The name of the repository where the secret will be added — fetched dynamically from the demo_repo resource.
secret_name: What the secret will be called in the GitHub Actions workflow (e.g., ${{ secrets.API_KEY }}).
plaintext_value: The secret value in plain text.
*/

resource "azurerm_resource_group" "demo_rg" {
  name     = "demo-rg"
  location = "Australia East"
}

resource "azurerm_app_service_plan" "demo_plan" {
  name                = "demo-app-service-plan"
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "backend_app" {
  name                = "demo-backend-app"
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
  app_service_plan_id = azurerm_app_service_plan.demo_plan.id

  app_settings = {
    "WEBSITES_PORT" = "5000" # if you're using Kestrel in .NET
  }

  site_config {
    linux_fx_version = "DOTNETCORE|8.0"
  }
}

resource "azurerm_app_service" "frontend_app" {
  name                = "demo-frontend-app"
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
  app_service_plan_id = azurerm_app_service_plan.demo_plan.id

  site_config {
    linux_fx_version = "NODE|18-lts"
  }
}
