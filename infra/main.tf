resource "azurerm_resource_group" "demo_rg" {
  name     = "demo-rg"
  location = var.location
}

resource "azurerm_app_service_plan" "demo_plan" {
  name                = "demo-app-service-plan"
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "backend" {
  name                = "demo-backend-app"
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
  app_service_plan_id = azurerm_app_service_plan.demo_plan.id
  site_config {}
}

resource "azurerm_app_service" "frontend" {
  name                = "demo-frontend-app"
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
  app_service_plan_id = azurerm_app_service_plan.demo_plan.id
  site_config {}
}