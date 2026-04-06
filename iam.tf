# ---------------------------------------------
# RBAC Assignments (INTENTIONALLY DISABLED)
# ---------------------------------------------
# These role assignments were designed to grant
# permissions to a Service Principal.
#
# They are currently commented out because:
# - Azure AD Application / SP creation requires
#   elevated directory permissions
# - This project avoids over-privileging identities
# - Follows least privilege and real-world practices
#
# In a production environment, these would be:
# - Enabled with a properly scoped Service Principal
# - Or imported if pre-existing
# ---------------------------------------------


# resource "azuread_application" "app" {
#  display_name = "${local.prefix}-app-${local.env}"
# }

#resource "azuread_service_principal" "sp" {
#  client_id = azuread_application.app.client_id
#}

#resource "azuread_application_password" "sp_secret" {
#  application_object_id = azuread_application.app.object_id
#  display_name          = "terraform-secret"
#}

# resource "azurerm_role_assignment" "rbac" {
#  scope                = azurerm_resource_group.rg.id
#  role_definition_name = "Reader" # least privilege
#  principal_id         = azuread_service_principal.sp.object_id
# }

# resource "azurerm_role_assignment" "reader" {
#   scope                = azurerm_resource_group.rg.id
#   role_definition_name = "Reader"
#   principal_id         = azuread_service_principal.sp.object_id
# }

# resource "azurerm_role_assignment" "monitoring" {
#   scope                = azurerm_resource_group.rg.id
#   role_definition_name = "Monitoring Reader"
#   principal_id         = azuread_service_principal.sp.object_id
# }