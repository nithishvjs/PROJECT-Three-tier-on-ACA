#Container_redis
resource "azurerm_container_app" "redis" {
  name                         = "redis"
  container_app_environment_id = azurerm_container_app_environment.aca_env.id
  resource_group_name          = azurerm_resource_group.nithi.name
  revision_mode                = "Multiple"

template {
    container {
      name   = "redis"
      image  = "redis:alpine"
      cpu    = "0.5"
      memory = "1Gi"
    }
  }
  
  ingress {
    external_enabled = false        
    target_port      = 6379
    transport            = "tcp" 

      traffic_weight {
        latest_revision = true
        percentage      = 100
    }
  }

  depends_on = [azurerm_container_app_environment.aca_env]
}