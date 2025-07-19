#Azure_container_environment
resource "azurerm_container_app_environment" "aca_env" {
  name                         = "my-Environment"
  location                     = azurerm_resource_group.nithi.location
  resource_group_name          = azurerm_resource_group.nithi.name
  infrastructure_subnet_id     = azurerm_subnet.aca_subnet.id

  depends_on = [azurerm_subnet.aca_subnet]
}