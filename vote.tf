#Container_vote
resource "azurerm_container_app" "vote" {
  name                         = "vote"
  container_app_environment_id = azurerm_container_app_environment.aca_env.id
  resource_group_name          = azurerm_resource_group.nithi.name
  revision_mode                = "Multiple"

  template {
    container {
      name   = "vote"
      image  = "nithi17/vote:latest"
      cpu    = "1"
      memory = "2Gi"

      env {
        name  = "REDIS_PORT"
        value = var.REDIS_PORT 
      }

      env {
        name  = "REDIS_HOST"
        value =  azurerm_container_app.redis.latest_revision_fqdn
      }
    }

    scale {
      min_replicas = 1
      max_replicas = 10

      rule {
        name = "http-scaling-rule"
        custom {
          type = "http"
          metadata = {
            concurrentRequests = "50" 
          }
        }
      }
    }
  }

  ingress {
    external_enabled = true   
    target_port      = 80     
    transport        = "http" 

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  depends_on = [azurerm_container_app.db, azurerm_container_app.redis]
}