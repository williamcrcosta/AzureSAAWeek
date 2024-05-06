# Settings Block
# Aqui estão as configurações do Terraform.
# required_providers é um bloco de configuração para definir
# os provedores de recurso necessários para o arquivo de configuração atual.
# Cada provedor é configurado com uma fonte e uma versão.
# A versão deve ser uma string que siga a especificação de versão do SemVer 2.0.0.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.99.0"
      # Versão do provedor de recursos do Azure
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.15.0"
      # Versão do provedor de recursos do Azure AD
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
      # Versão do provedor de recursos random
    }
  }
}
