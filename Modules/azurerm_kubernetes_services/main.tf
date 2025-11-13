resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.kubernetes_cluster
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.default_node_pool.name
    node_count = each.value.default_node_pool.node_count
    vm_size    = each.value.default_node_pool.vm_size
  }


  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}


# resource "azurerm_role_assignment" "aks_to_acr_role" {
#   for_each             = var.kubernetes_cluster
#   scope                = var.acr[each.key]
#   role_definition_name = "AcrPull"
#   principal_id                     = azurerm_kubernetes_cluster.aks[each.key].kubelet_identity[0].object_id
#   skip_service_principal_aad_check = true
# }

resource "azurerm_role_assignment" "github_sp_admin" {
  scope                = "/subscriptions/470e0441-3f52-4fdf-8fc5-508cd114ccbc"
  role_definition_name = "User Access Administrator"
  principal_id         = "31f87946-f96c-4d3d-82eb-4d77e73f0ddf"
}
