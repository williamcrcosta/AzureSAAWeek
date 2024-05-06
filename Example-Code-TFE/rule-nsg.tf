# Regra de NSG que permite acesso à porta 3389 (RDP) de qualquer origem
# Essa regra permite que qualquer máquina, dentro ou fora da rede virtual, possa
# acessar a porta 3389 (RDP) das máquinas dentro da sub-rede "subnet-example".
resource "azurerm_network_security_rule" "rule-example" {
    name                        = "rule-example"
    resource_group_name         = azurerm_resource_group.rg-example.name
    network_security_group_name = azurerm_network_security_group.nsg-example.name
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "3389"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"

    depends_on = [
        azurerm_network_security_group.nsg-example
        ]
}

# Associação da regra de NSG com a sub-rede
# Aqui, a associação é feita entre a sub-rede "subnet-example" e o grupo de segurança de rede "nsg-example".
# Isso significa que todas as máquinas dentro da sub-rede "subnet-example" terão acesso à porta 3389 (RDP) das máquinas
# dentro da sub-rede, desde que a regra de NSG esteja habilitada (padrão).
resource "azurerm_subnet_network_security_group_association" "nsg-assoc-example" {
    subnet_id                 = azurerm_subnet.subnet-example.id
    network_security_group_id = azurerm_network_security_group.nsg-example.id

    depends_on = [
        azurerm_network_security_group.nsg-example
        ]
}
