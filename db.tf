#Container_db
resource "azurerm_container_app" "db" {
  name                         = "db"
  container_app_environment_id = azurerm_container_app_environment.aca_env.id
  resource_group_name          = azurerm_resource_group.nithi.name
  revision_mode                = "Multiple"

template {
    container {
      name   = "db"
      image  = "bitnami/postgresql:17"
      cpu    = "0.5"
      memory = "1Gi"

    env {
      name  = "POSTGRES_DB"
      value = var.POSTGRES_DB 
    }

    env {
      name  = "POSTGRES_USER"
      value = var.POSTGRES_USER
    }

    env {
      name  = "POSTGRES_PASSWORD"
      value = var.POSTGRES_PASSWORD 
    }
  }
}

ingress {
  external_enabled = false     
  target_port      = 5432
  transport        = "tcp" 

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  depends_on = [azurerm_container_app_environment.aca_env]
}