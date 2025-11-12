resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.sql_db_server
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  tags = {
    environment = "production"
  }
}

output "sql_db_server" {
  value = { for k, v in azurerm_mssql_server.sql_server : k => v.id}
}
