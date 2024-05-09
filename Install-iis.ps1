# Install IIS
Add-WindowsFeature -Name Web-Server -IncludeManagementTools

# Desativa Firewall Windows
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False 

# Faz download do Dotnet Hosting copiando para a raiz do disco C.
wget "https://download.visualstudio.microsoft.com/download/pr/00397fee-1bd9-44ef-899b-4504b26e6e96/ab9c73409659f3238d33faee304a8b7c/dotnet-hosting-8.0.4-win.exe" -OutFile C:\dotnet-hosting-8.0.4-win.exe; 

# Instala o Dotnet Hosting sem wizard
C:\dotnet-hosting-8.0.4-win.exe /quiet


#Faz download do pacote das publicações e Banco
wget "https://stodiskdesafio.blob.core.windows.net/saa/Sistema.zip" -OutFile C:\Sistema.zip;

# Extrai os arquivos e adiciona no diretório wwwroot
Expand-Archive C:\Sistema.zip -DestinationPath C:\

Copy-Item -Path C:\Sistema\Dashboard -Destination C:\inetpub\wwwroot\
Copy-Item -Path C:\Sistema\Sistema -Destination C:\inetpub\wwwroot\

##Expand-Archive C:\Users\Administrator\Downloads\Sistema.zip -DestinationPath C:\inetpub\wwwroot\

# Remove arquivo do Banco de Dados
##Remove-Item -Path C:\inetpub\wwwroot\Sistema\*.bacpac -Recurse

# Stop do Site Default
Stop-WebSite -Name "Default Web Site"


# Remove-Website -Name "Default Web Site"

#Remove-Item -Path IIS:\AppPools\DefaultAppPool

# New-WebAppPool -Name Sistema -Force

# Criar Application Pool Sistema
New-Item –Path IIS:\AppPools\Sistema

# Criar Application Pool Sistema
New-Item –Path IIS:\AppPools\Dashboard

# Criar novo Web-Site
New-Website -Name "Sistema" -Port 80 -PhysicalPath "C:\inetpub\wwwroot\Sistema\Sistema" -ApplicationPool "Sistema"

#Cra novo Web-Site
New-Website -Name "Dashboard" -Port 8080 -PhysicalPath "C:\inetpub\wwwroot\Sistema\Dashboard" -ApplicationPool "Dashboard"



# Realiza o restart da maquina pós instalação dos componentes.
#Restart-Computer

#Get-ChildItem -Path IIS:\AppPools


#Get-ItemProperty IIS:\AppPools\Dashboard | select *


