#Virtual_network
resource "azurerm_virtual_network" "vnet" {
  name                = "aca-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.nithi.location
  resource_group_name = azurerm_resource_group.nithi.name
}

#Virtual_subnet
resource "azurerm_subnet" "gateway" {
  name                 = "app-gateway-subnet"
  resource_group_name  = azurerm_resource_group.nithi.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "aca_subnet" {
  name                 = "env-subnet"
  resource_group_name  = azurerm_resource_group.nithi.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.4.0/22"]

  depends_on = [azurerm_resource_group.nithi]
}