provider "vault" {
  address = var.vault_address
}

# Enable the KV secrets engine at the specified path
resource "vault_mount" "kv_secrets" {
  path = var.secrets_engine_path
  type = "kv-v2"
}

# Enable AppRole authentication method
resource "vault_auth_backend" "approle" {
  type        = "approle"
  description = "AppRole authentication for applications"
}

# Create the AppRole with token policies attached
resource "vault_approle_auth_backend_role" "example_role" {
  role_name     = var.approle_role_name
  secret_id_ttl = var.approle_secret_id_ttl_seconds
  token_ttl     = var.approle_token_ttl
  token_max_ttl = var.approle_token_max_ttl_seconds
  token_policies = var.approle_policies
}
# Create a custom Vault policy
resource "vault_policy" "example_policy" {
  name = "example-policy"

  policy = <<EOT
path "auth/approle/login" {
  capabilities = ["create"]
}

path "secret/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}