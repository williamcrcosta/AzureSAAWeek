# Create Network Security Group (NSG)
resource "azurerm_network_security_group" "nsg-sub-app" {
  name                = "nsg-sub-app"
  location            = azurerm_resource_group.rg-local.location
  resource_group_name = azurerm_resource_group.rg-local.name

  security_rule {
    name                       = "RDP"
    priority                   = 500
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.1.0/24"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 600
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.1.0/24"
  }

  tags = {
    Environment = "Local"
    Project     = "SAA"
  }
}

resource "azurerm_network_security_group" "nsg-sub-db" {
  name                = "nsg-sub-db"
  location            = azurerm_resource_group.rg-local.location
  resource_group_name = azurerm_resource_group.rg-local.name

  security_rule {
    name                       = "RDP"
    priority                   = 500
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.2.0/24"
  }

  tags = {
    Environment = "Local"
    Project     = "SAA"
  }
}