variable "identity_domains_identity_settings" {
  description = <<EOT
Map of identity_domains_identity_settings, attributes below
Required:
    - idcs_endpoint
    - identity_setting_id
    - schemas
Optional:
    - attribute_sets
    - attributes
    - authorization
    - emit_locked_message_when_user_is_locked
    - external_id
    - ocid
    - primary_email_required
    - resource_type_schema_version
    - return_inactive_over_locked_message
    - user_allowed_to_set_recovery_email
    - my_profile (block):
        - allow_end_users_to_change_their_password (optional)
        - allow_end_users_to_link_their_support_account (optional)
        - allow_end_users_to_manage_their_capabilities (optional)
        - allow_end_users_to_update_their_security_settings (optional)
    - posix_gid (block):
        - manual_assignment_ends_at (optional)
        - manual_assignment_starts_from (optional)
    - posix_uid (block):
        - manual_assignment_ends_at (optional)
        - manual_assignment_starts_from (optional)
    - tags (block):
        - key (required)
        - value (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - tokens (block):
        - expires_after (optional)
        - type (required)
EOT

  type = map(object({
    idcs_endpoint                           = string
    identity_setting_id                     = string
    schemas                                 = list(string)
    attribute_sets                          = optional(list(string))
    attributes                              = optional(string)
    authorization                           = optional(string)
    emit_locked_message_when_user_is_locked = optional(bool)
    external_id                             = optional(string)
    ocid                                    = optional(string)
    primary_email_required                  = optional(bool)
    resource_type_schema_version            = optional(string)
    return_inactive_over_locked_message     = optional(bool)
    user_allowed_to_set_recovery_email      = optional(bool)
    my_profile = optional(object({
      allow_end_users_to_change_their_password          = optional(bool)
      allow_end_users_to_link_their_support_account     = optional(bool)
      allow_end_users_to_manage_their_capabilities      = optional(bool)
      allow_end_users_to_update_their_security_settings = optional(bool)
    }))
    posix_gid = optional(object({
      manual_assignment_ends_at     = optional(number)
      manual_assignment_starts_from = optional(number)
    }))
    posix_uid = optional(object({
      manual_assignment_ends_at     = optional(number)
      manual_assignment_starts_from = optional(number)
    }))
    tags = optional(list(object({
      key   = string
      value = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    tokens = optional(list(object({
      expires_after = optional(number)
      type          = string
    })))
  }))
}

