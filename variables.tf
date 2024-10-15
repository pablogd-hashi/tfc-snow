# Variable for Vault address
variable "vault_address" {
  description = "Vault address to connect to"
  type        = string
 # default     = "https://your-vault-address"  # You can set a default value or pass it from the calling repo.
}

# Variable for secrets engine path
variable "secrets_engine_path" {
  description = "The path where the secrets engine will be enabled"
  type        = string
  default     = "secret"
}

# Variable for AppRole role name
variable "approle_role_name" {
  description = "The name of the AppRole"
  type        = string
  default     = "example-role"
}

variable "approle_secret_id_ttl_seconds" {
  type    = number
  default = 86400  # 24 hours in seconds
}

variable "approle_token_ttl_seconds" {
  type    = number
  default = 86400  # 24 hours in seconds
}

variable "approle_token_max_ttl_seconds" {
  type    = number
  default = 259200  # 72 hours in seconds
}
# Variable for the policies attached to the AppRole
variable "approle_policies" {
  description = "Policies attached to the AppRole"
  type        = list(string)
  default     = ["default", "example-policy"]
}

variable "approle_token_ttl" {
  type        = number
  description = "TTL for AppRole token in seconds"
  default     = 86400  # Default to 24 hours in seconds
}

# Variable for custom policy
variable "custom_policy" {
  description = "Custom Vault policy"
  type        = string
  default     = <<EOT
  path "secret/data/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
  }
  path "auth/approle/login" {
    capabilities = ["read", "write"]
  }
  EOT
}
