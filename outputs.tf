output "actions_organization_permissions_id" {
  description = "Map of id values across all actions_organization_permissions, keyed the same as var.actions_organization_permissions"
  value       = { for k, v in github_actions_organization_permissions.actions_organization_permissions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "actions_organization_permissions_allowed_actions" {
  description = "Map of allowed_actions values across all actions_organization_permissions, keyed the same as var.actions_organization_permissions"
  value       = { for k, v in github_actions_organization_permissions.actions_organization_permissions : k => v.allowed_actions if v.allowed_actions != null && length(v.allowed_actions) > 0 }
}
output "actions_organization_permissions_allowed_actions_config" {
  description = "Map of allowed_actions_config values across all actions_organization_permissions, keyed the same as var.actions_organization_permissions"
  value       = { for k, v in github_actions_organization_permissions.actions_organization_permissions : k => one(v.allowed_actions_config) if v.allowed_actions_config != null && length(v.allowed_actions_config) > 0 }
}
output "actions_organization_permissions_enabled_repositories" {
  description = "Map of enabled_repositories values across all actions_organization_permissions, keyed the same as var.actions_organization_permissions"
  value       = { for k, v in github_actions_organization_permissions.actions_organization_permissions : k => v.enabled_repositories if v.enabled_repositories != null && length(v.enabled_repositories) > 0 }
}
output "actions_organization_permissions_enabled_repositories_config" {
  description = "Map of enabled_repositories_config values across all actions_organization_permissions, keyed the same as var.actions_organization_permissions"
  value       = { for k, v in github_actions_organization_permissions.actions_organization_permissions : k => one(v.enabled_repositories_config) if v.enabled_repositories_config != null && length(v.enabled_repositories_config) > 0 }
}
output "actions_organization_permissions_sha_pinning_required" {
  description = "Map of sha_pinning_required values across all actions_organization_permissions, keyed the same as var.actions_organization_permissions"
  value       = { for k, v in github_actions_organization_permissions.actions_organization_permissions : k => v.sha_pinning_required if v.sha_pinning_required != null }
}

