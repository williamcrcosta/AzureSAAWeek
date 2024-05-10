# Cria interface de rede para a VM
resource "azurerm_network_interface" "vm-app-nic01" {
  name                = "vm-app-nic01"                           # Nome da interface de rede
  location            = azurerm_resource_group.rg-local.location # Localização do grupo de recursos
  resource_group_name = azurerm_resource_group.rg-local.name     # Nome do grupo de recursos
  tags                = var.tags

  ip_configuration {
    name                          = "vm-app-nic-config01"             # Nome da configuração de IP
    subnet_id                     = azurerm_subnet.sub-app.id         # ID da sub-rede
    private_ip_address_allocation = "Dynamic"                         # Método de atribuição de endereço IP
    public_ip_address_id          = azurerm_public_ip.vm-app-pip01.id # ID do IP público
  }
}

# Cria um IP público
resource "azurerm_public_ip" "vm-app-pip01" {
  name                = "vm-app-pip01"                           # Nome do IP público
  location            = azurerm_resource_group.rg-local.location # Localização do grupo de recursos
  resource_group_name = azurerm_resource_group.rg-local.name     # Nome do grupo de recursos
  allocation_method   = "Static"                                 # Método de atribuição de endereço IP

  tags = {
    Environment = "Local" # Valores das tags
    Project     = "SAA"
  }
}

# Cria a VM
resource "azurerm_windows_virtual_machine" "vm-app" {
  name                = "vm-app"                                 # Nome da VM
  location            = azurerm_resource_group.rg-local.location # Localização do grupo de recursos
  resource_group_name = azurerm_resource_group.rg-local.name     # Nome do grupo de recursos
  size                = "Standard_B2s"                           # Tamanho da VM
  admin_username      = var.win_username                         # Nome de usuário do Windows
  admin_password      = var.win_userpass                         # Senha de usuário do Windows
  network_interface_ids = [
    azurerm_network_interface.vm-app-nic01.id # ID da interface de rede
  ]

  os_disk {
    caching              = "ReadWrite"      # Modo de cache do disco
    storage_account_type = "Standard_LRS"   # Tipo de conta de armazenamento
    disk_size_gb         = 128              # Tamanho do disco em GB
    name                 = "vm-app-os-disk" # Nome do disco
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"        # Editor da imagem
    offer     = "WindowsServer"                 # Nome da oferta
    sku       = "2022-datacenter-azure-edition" # SKU da imagem
    #    sku       = "SQL-Server-2022-on-Windows-Server-2022"
    version = "latest" # Versão da imagem
  }

  tags = {
    Environment = "SAA" # Valores das tags
  }
}

# Extensão para instalar o IIS e desabilitar o Firewall no Windows
resource "azurerm_virtual_machine_extension" "install-iis" {
  name                 = "install-iis"                             # Nome da extensão
  virtual_machine_id   = azurerm_windows_virtual_machine.vm-app.id # ID da VM
  publisher            = "Microsoft.Compute"                       # Editor da extensão
  type                 = "CustomScriptExtension"                   # Nome da extensão
  type_handler_version = "1.8"                                     # Versão da extensão

  settings = <<SETTINGS
    {
      "fileUris": ["endpoint"], # URLs para arquivos de configuração
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File command.ext" # Comando a ser executado
    }
SETTINGS
  # Comentário para destacar a criação da extensão
}
