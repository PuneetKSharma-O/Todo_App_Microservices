module "resource_group" {
  source         = "../../Modules/azurerm_resource_group"
  resource_group = var.resource_group
}
module "storage_account" {
  depends_on      = [module.resource_group]
  source          = "../../Modules/azurerm_storage_account"
  storage_account = var.storage_account
}
module "kubernetes_cluster" {
  depends_on         = [module.resource_group, module.acr]
  source             = "../../Modules/azurerm_kubernetes_services"
  kubernetes_cluster = var.kubernetes_cluster
  acr                = module.acr.acr
}
module "acr" {
  depends_on = [module.resource_group]
  source     = "../../Modules/azurerm_acr"
  acr        = var.acr
}
# module "sql_db_server" {
#   depends_on    = [module.resource_group]
#   source        = "../../Modules/azurerm_sql_server"
#   sql_db_server = var.sql_db_server
# }
# module "sql_db" {
#   depends_on    = [module.sql_db_server]
#   source        = "../../Modules/azurerm_sql_database"
#   sql_db        = var.sql_db 
#   sql_db_server = module.sql_db_server.sql_db_server
# }

