# Create Network Security Group (NSG)
# Esse recurso cria um grupo de segurança de rede (NSG) chamado "nsg-sub-app" com as regras de segurança abaixo.
# O NSG será associado à sub-rede "sub-app" e permite acesso às portas 3389 (RDP) e 80 (HTTP) de qualquer máquina na sub-rede.
resource "azurerm_network_security_group" "nsg-sub-app" {
  name                = "nsg-sub-app"
  location            = azurerm_resource_group.rg-local.location
  resource_group_name = azurerm_resource_group.rg-local.name
  tags                = var.tags
  security_rule {
    # Regra que permite acesso à porta 3389 (RDP) de qualquer origem na sub-rede "sub-app"
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
    # Regra que permite acesso à porta 80 (HTTP) de qualquer origem na sub-rede "sub-app"
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
}

# Create Network Security Group (NSG)
# Esse recurso cria um grupo de segurança de rede (NSG) chamado "nsg-sub-db" com as regras de segurança abaixo.
# O NSG será associado à sub-rede "sub-db" e permite acesso à porta 3389 (RDP) de qualquer máquina na sub-rede.
resource "azurerm_network_security_group" "nsg-sub-db" {
  name                = "nsg-sub-db"
  location            = azurerm_resource_group.rg-local.location
  resource_group_name = azurerm_resource_group.rg-local.name

  security_rule {
    # Regra que permite acesso à porta 3389 (RDP) de qualquer origem na sub-rede "sub-db"
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
