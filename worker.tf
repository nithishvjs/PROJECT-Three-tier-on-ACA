#Container_worker
resource "azurerm_container_app" "worker" {
  name                         = "worker"
  container_app_environment_id = azurerm_container_app_environment.aca_env.id
  resource_group_name          = azurerm_resource_group.nithi.name
  revision_mode                = "Multiple"

  template {
    container {
      name   = "worker"
      image  = "nithi17/worker:latest"
      cpu    = "1"
      memory = "2Gi"

      env {
        name  = "REDIS_PORT"
        value = var.REDIS_PORT 
      }

      env {
        name  = "REDIS_HOST"
        value = azurerm_container_app.redis.latest_revision_fqdn
      }

      env {
        name  = "POSTGRES_PORT"
        value = var.POSTGRES_PORT 
      }

      env {
        name  = "POSTGRES_USER"
        value = var.POSTGRES_USER
      }

      env {
        name  = "POSTGRES_PASSWORD"
        value = var.POSTGRES_PASSWORD 
      }

      env {
        name  = "POSTGRES_HOST"
        value = azurerm_container_app.db.latest_revision_fqdn
      }

      env {
        name  = "POSTGRES_DB"
        value = var.POSTGRES_DB
      }
    }
  }

  depends_on = [azurerm_container_app.db, azurerm_container_app.redis]
}