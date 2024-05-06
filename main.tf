# Configuração geral do Terraform
# required_providers é um bloco de configuração para definir
# os provedores de recurso necessários para o arquivo de configuração atual.
# Cada provedor é configurado com uma fonte e uma versão.
# A versão deve ser uma string que siga a especificação de versão do SemVer 2.0.0.
terraform {
  required_providers {
    azurerm = { # Provedor de recursos do Azure
      source  = "hashicorp/azurerm" # Fonte do provedor
      version = ">=3.99.0" # Versão do provedor
    }

    random = { # Provedor de recursos random
      source  = "hashicorp/random" # Fonte do provedor
      version = "3.6.0" # Versão do provedor
    }
  }
}
