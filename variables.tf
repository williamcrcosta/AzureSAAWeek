# Variável de usuário do Windows
# O valor padrão é "admin.windows"
variable "win_username" {
  description = "Nome de usuário do Windows"
  type        = string
  sensitive   = true # Marca como confidencial
  default     = "admin.windows"
}

# Variável de senha do Windows
# O valor padrão é "Passw@rd12345"
variable "win_userpass" {
  description = "Senha do Windows"
  type        = string
  sensitive   = true # Marca como confidencial
  default     = "Passw@rd12345"
}

# Variável de ambiente "adminsql"
# O valor padrão é "adminsql"
variable "adminsql" {
  description = "Valor para a variável de ambiente 'adminsql'"
  type        = string
  default     = "adminsql"
  sensitive = true # Marca como confidencial
}

# Variável de ambiente "passwordsql"
# O valor padrão é a senha do Windows
variable "passwordsql" {
  description = "Valor para a variável de ambiente 'passwordsql'"
  type        = string
  default     = var.win_userpass
  sensitive = true # Marca como confidencial
}
