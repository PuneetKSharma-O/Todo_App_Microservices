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


resource "azurerm_role_assignment" "aks_to_acr_role" {
  for_each             = var.kubernetes_cluster
  scope                = var.acr[each.key]
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks[each.key].identity.principal_id
  # principal_id                     = azurerm_kubernetes_cluster.aks[each.key].kubelet_identity[0].object_id
  skip_service_principal_aad_check = true
}

