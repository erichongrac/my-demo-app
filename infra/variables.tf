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
