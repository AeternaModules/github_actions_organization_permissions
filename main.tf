resource "github_actions_organization_permissions" "actions_organization_permissionses" {
  for_each = var.actions_organization_permissionses

  enabled_repositories = each.value.enabled_repositories
  allowed_actions      = each.value.allowed_actions
  sha_pinning_required = each.value.sha_pinning_required

  dynamic "allowed_actions_config" {
    for_each = each.value.allowed_actions_config != null ? [each.value.allowed_actions_config] : []
    content {
      github_owned_allowed = allowed_actions_config.value.github_owned_allowed
      patterns_allowed     = allowed_actions_config.value.patterns_allowed
      verified_allowed     = allowed_actions_config.value.verified_allowed
    }
  }

  dynamic "enabled_repositories_config" {
    for_each = each.value.enabled_repositories_config != null ? [each.value.enabled_repositories_config] : []
    content {
      repository_ids = enabled_repositories_config.value.repository_ids
    }
  }
}

