# provider "azurerm" block
# Esse bloco de código configura o provedor de recursos do Azure
# para o Terraform.
# Aqui estão as configurações do provedor de recursos do Azure.
# A id da assinatura é a UUID da assinatura do Azure.
# A id do cliente é a UUID do aplicativo do Azure AD.
# A chave secreta do cliente é a chave secreta do aplicativo do Azure AD.
# A id do locatário é a UUID do locatário do Azure AD.
provider "azurerm" {
  features {}
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}