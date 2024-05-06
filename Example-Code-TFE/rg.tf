# Esse recurso cria um grupo de recursos (Resource Group)
# com o nome "rg-local02" e na localização "eastus2".
# Os valores do objeto "tags" são usados como "tags" para o recurso.
resource "azurerm_resource_group" "rg-example" {
    name     = "" # Nome do grupo de recursos
    location = ""    # Localização do grupo de recursos
    tags = {               # Tags do grupo de recursos
        Environment = "" # Nome e Valor da Tag
        Team = ""                # Nome e Valor da Tag
    }
}