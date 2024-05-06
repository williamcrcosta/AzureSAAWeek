variable "win_username" {
  description = "Windows node username"
  type        = string
  # sensitive   = false
  default = "admin.windows"
}

variable "win_userpass" {
  description = "Windows node password"
  type        = string
  # sensitive   = true
  default = "Passw@rd12345"
}

variable "adminsql" {
  description = "value for adminsql"
  type        = string
  default     = "adminsql"
  //sensitive = true
}

variable "passwordsql" {
  description = "value for passwordsql"
  type        = string
  default     = variables.win_userpass
  //sensitive = truey
}