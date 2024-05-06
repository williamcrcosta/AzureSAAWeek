# Esse recurso cria uma rede virtual (Virtual Network) chamada "vnet-example"
# com o prefixo de endereço IPv4 "192.168.0.0/16"
resource "azurerm_virtual_network" "vnet-example" {
    name                = "vnet-example" # Nome da rede virtual
    location            = azurerm_resource_group.example.location # Localização da rede virtual
    resource_group_name = azurerm_resource_group.example.name # Nome do grupo de recursos
    address_space       = ["192.168.0.0/16"] # Prefixo de endereço da rede virtual
    tags = {
        Environment = "" # Nome e Valor da Tag
        Team = ""                # Nome e Valor da Tag
    }
}

# Esse recurso cria uma sub-rede chamada "subnet-example" dentro da rede virtual "vnet-example"
# com o prefixo de endereço IPv4 "192.168.10.0/24" e habilitado o endpoint de serviço "Microsoft.KeyVault".
resource "azurerm_subnet" "subnet-example" {
    name                 = "subnet-example" # Nome da sub-rede
    resource_group_name  = azurerm_resource_group.rg-example.name # Nome do grupo de recursos
    virtual_network_name = azurerm_virtual_network.vnet-example.name # Nome da rede virtual
    address_prefixes     = ["192.168.10.0/24"] # Prefixo de endereço da sub-rede
    service_endpoints    = ["Microsoft.KeyVault"] # Endpoint de serviço habilitado na sub-rede

    depends_on = [azurerm_virtual_network.vnet-example]
    private_endpoint_network_policies_enabled = true
}

# Esse recurso cria um grupo de segurança de rede (Network Security Group) chamado "nsg-example"
# com o nome do grupo de recursos "rg-example" e localização "eastus2".
# Os valores do objeto "tags" são usados como "tags" para o recurso.
resource "azurerm_network_security_group" "nsg-example" {
    name                = "nsg-example" # Nome do grupo de segurança de rede
    location            = azurerm_resource_group.example.location # Localização do grupo de segurança de rede
    resource_group_name = azurerm_resource_group.rg-example.name # Nome do grupo de recursos
    tags = {
        Environment = "" # Nome e Valor da Tag
        Team = ""                # Nome e Valor da Tag
    }
}

# Esse recurso associa o grupo de segurança de rede "nsg-example" à sub-rede "subnet-example".
resource "azurerm_subnet_network_security_group_association" "nsg-association-example" {
    subnet_id                 = azurerm_subnet.subnet-example.id # ID da sub-rede
    network_security_group_id = azurerm_network_security_group.nsg-example.id # ID do grupo de segurança de rede
    depends_on = [azurerm_network_security_group.nsg-example]
    }
