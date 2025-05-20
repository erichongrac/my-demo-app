variable "github_token" {
  type      = string
  default   = ""
  sensitive = true
}

variable "github_owner" {
  type    = string
  default = ""
}

variable "azure_subscription_id" {
  type = string
}

variable "azure_client_id" {
  description = "Azure client ID"
  type        = string
}

variable "azure_client_secret" {
  description = "Azure client secret"
  type        = string
}

variable "azure_tenant_id" {
  description = "Azure tenant ID"
  type        = string
}
