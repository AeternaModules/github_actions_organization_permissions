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
  # --- Unconfirmed validation candidates, derived from github_actions_organization_permissions's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: allowed_actions
  #   condition: contains(["all", "local_only", "selected"], value)
  #   message:   must be one of: all, local_only, selected
  # path: enabled_repositories
  #   condition: contains(["all", "none", "selected"], value)
  #   message:   must be one of: all, none, selected
}

