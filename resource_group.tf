#Provider
provider "azurerm" {
    features {}
    subscription_id = var.subscription_id
}

#Resource_group
resource "azurerm_resource_group" "nithi" {
  name     = "my-app1"
  location = "West Europe"
}