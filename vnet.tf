# Create Virtual Network (VNet)
# Cria uma rede virtual (VNet) com endereço IPv4 10.0.0.0/16
resource "azurerm_virtual_network" "vnet-local" {
  name                = "vnet-local"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-local.location
  resource_group_name = azurerm_resource_group.rg-local.name

  tags = {
    Environment = "Local"
    Project     = "SAA"
  }
} # Fim da criação da VNet "vnet-local"

# Create subnet 01 on VNet
resource "azurerm_subnet" "sub-app" {
  name                 = "sub-app"
  resource_group_name  = azurerm_resource_group.rg-local.name
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = azurerm_virtual_network.vnet-local.name
}

# Create subnet 02 on Vnet
resource "azurerm_subnet" "sub-db" {
  name                 = "sub-db"
  resource_group_name  = azurerm_resource_group.rg-local.name
  address_prefixes     = ["10.0.2.0/24"]
  virtual_network_name = azurerm_virtual_network.vnet-local.name
}

resource "azurerm_subnet_network_security_group_association" "nsg-ass-sub-app" {
  subnet_id                 = azurerm_subnet.sub-app.id
  network_security_group_id = azurerm_network_security_group.nsg-sub-app.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-ass-sub-db" {
  subnet_id                 = azurerm_subnet.sub-db.id
  network_security_group_id = azurerm_network_security_group.nsg-sub-db.id
}