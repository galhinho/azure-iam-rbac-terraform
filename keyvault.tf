resource "azurerm_key_vault" "kv" {
  name                = "${local.prefix}kv${local.env}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  tags = {
    environment = local.env
    project     = "iam"
    owner       = local.prefix
  }
}

resource "azurerm_key_vault_access_policy" "current" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = ["Set", "Get", "List"]
}

resource "azurerm_key_vault_secret" "sp_secret" {
  name         = "sp-client-secret"
  value        = "placeholder-secret"
  key_vault_id = azurerm_key_vault.kv.id

  depends_on = [
    azurerm_key_vault_access_policy.current
  ]
}
