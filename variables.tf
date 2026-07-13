variable "actions_organization_permissionses" {
  description = <<EOT
Map of actions_organization_permissionses, attributes below
Required:
    - enabled_repositories
Optional:
    - allowed_actions
    - sha_pinning_required
    - allowed_actions_config (block):
        - github_owned_allowed (required)
        - patterns_allowed (optional)
        - verified_allowed (optional)
    - enabled_repositories_config (block):
        - repository_ids (required)
EOT

  type = map(object({
    enabled_repositories = string
    allowed_actions      = optional(string)
    sha_pinning_required = optional(bool)
    allowed_actions_config = optional(object({
      github_owned_allowed = bool
      patterns_allowed     = optional(set(string))
      verified_allowed     = optional(bool)
    }))
    enabled_repositories_config = optional(object({
      repository_ids = set(number)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.actions_organization_permissionses : (
        v.allowed_actions == null || (contains(["all", "local_only", "selected"], v.allowed_actions))
      )
    ])
    error_message = "must be one of: all, local_only, selected"
  }
  validation {
    condition = alltrue([
      for k, v in var.actions_organization_permissionses : (
        contains(["all", "none", "selected"], v.enabled_repositories)
      )
    ])
    error_message = "must be one of: all, none, selected"
  }
}

