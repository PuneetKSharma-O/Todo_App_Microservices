module "resource_group" {
  source         = "../../Modules/azurerm_resource_group"
  resource_group = var.resource_group
}
