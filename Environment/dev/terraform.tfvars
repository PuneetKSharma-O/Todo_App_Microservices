resource_group = {
  "rg1" = {
    name     = "rg-dev1"
    location = "centralindia"
  }
}
storage_account = {
  "stg1" = {
    name                     = "devtodomicrostg1234"
    resource_group_name      = "rg-dev1"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
  }
}

kubernetes_cluster = {
  "AKS1" = {
    name                = "dev-aks-cluster2"
    location            = "centralindia"
    dns_prefix          = "devaks1"
    resource_group_name = "rg-dev1"
    default_node_pool = {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_B2s"
    }
    ingress_application_gateway = {
      enabled = true
    }
    identity = {
      type = "SystemAssigned"
    }
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
  }
}
acr = {
  "AKS1" = {
    name                = "todomicroservicesacr1234"
    resource_group_name = "rg-dev1"
    location            = "centralindia"
    sku                 = "Basic"
    admin_enabled       = true
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
  }
}

sql_db_server = {
  "sqlserver1" = {
    name                = "devtodomicrosqlsvr1234"
    resource_group_name = "rg-dev1"
    location            = "centralindia"
    administrator_login = "sqladminuser"
    administrator_login_password = "P@ssw0rd1234!"
    version             = "12.0"
    tags = {
      environment = "dev"
      project     = "todo-app"
    }
  }
}
sql_db = {
  "sqlserver1" = {
    name      = "devtodomicrosqldb1234"
  }
}