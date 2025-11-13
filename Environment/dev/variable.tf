variable "resource_group" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}
variable "storage_account" {
  description = "A map of storage account configurations."
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = optional(map(string))
  }))

}

variable "kubernetes_cluster" {
  type = map(object({
    name                = string
    location            = string
    dns_prefix          = string
    resource_group_name = string
    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })

    identity = object({
      type = string
    })
    managed_by = optional(string)
    tags       = optional(map(string))
  }))

}

variable "acr" {
    description = "A map of Azure Container Registry configurations."
    type = map(object({
        name                = string
        resource_group_name = string
        location            = string
        sku                 = string
        admin_enabled       = bool
        tags                = optional(map(string))
    })) 
  
}

# variable "sql_db_server" {
#     description = "A map of SQL Database Server configurations."
#     type = map(object({
#         name                         = string
#         resource_group_name          = string
#         location                     = string
#         version                      = string
#         administrator_login          = string
#         administrator_login_password = string
#         minimum_tls_version          = optional(string)
#     }))
  
# }
# variable "sql_db" {
#   description = "A map of SQL Database configurations."
#   type = map(object({
#     name         = string
#     collation    = optional(string)
#     license_type = optional(string)
#     max_size_gb  = optional(number)
#     sku_name     = optional(string)
#     enclave_type = optional(string)
#     tags         = optional(map(string))
#   }))

# }
