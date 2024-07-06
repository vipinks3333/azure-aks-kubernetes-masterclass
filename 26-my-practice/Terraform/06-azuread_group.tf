resource "azuread_group" "aks_administrators" {
  display_name     = "${azurerm_resource_group.aks_rg.name}-administrators"
  description = "AKS adminitrator group for the ${azurerm_resource_group.aks_rg.name}"
  security_enabled = true
}

# resource "azuread_user" "ad-user" {
#   user_principal_name = "vipinksofc@gmail.com"
#   display_name        = "vipin.ks"
#   mail_nickname       = "vipin"
#   password            = "Password@123"
# }
# data "azuread_user" "ad-user" {
#   user_principal_name = azuread_user.ad-user.user_principal_name
# }


# resource "azuread_group_member" "group-member" {
#   group_object_id  = azuread_group.aks_administrators.id
#   member_object_id = azuread_user.ad-user.id
# }