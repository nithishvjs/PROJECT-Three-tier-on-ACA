output "container_app_vote_fqdn" {  
  description = "The FQDN for vote"
  value       = azurerm_container_app.vote.latest_revision_fqdn
}

output "container_app_result_fqdn" {
  description = "The FQDN for result"
  value       = azurerm_container_app.result.latest_revision_fqdn
}