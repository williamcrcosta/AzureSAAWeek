resource "azurerm_resource_group" "rg-local" {
  name     = "rg-local"
  location = "eastus2"

  tags = {
    Environment = "Local"
    Project     = "SAA"
  }
}