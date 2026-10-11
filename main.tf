resource "oci_identity_domains_identity_setting" "identity_domains_identity_settings" {
  for_each = var.identity_domains_identity_settings

  idcs_endpoint                           = each.value.idcs_endpoint
  identity_setting_id                     = each.value.identity_setting_id
  schemas                                 = each.value.schemas
  attribute_sets                          = each.value.attribute_sets
  attributes                              = each.value.attributes
  authorization                           = each.value.authorization
  emit_locked_message_when_user_is_locked = each.value.emit_locked_message_when_user_is_locked
  external_id                             = each.value.external_id
  ocid                                    = each.value.ocid
  primary_email_required                  = each.value.primary_email_required
  resource_type_schema_version            = each.value.resource_type_schema_version
  return_inactive_over_locked_message     = each.value.return_inactive_over_locked_message
  user_allowed_to_set_recovery_email      = each.value.user_allowed_to_set_recovery_email

  dynamic "my_profile" {
    for_each = each.value.my_profile != null ? [each.value.my_profile] : []
    content {
      allow_end_users_to_change_their_password          = my_profile.value.allow_end_users_to_change_their_password
      allow_end_users_to_link_their_support_account     = my_profile.value.allow_end_users_to_link_their_support_account
      allow_end_users_to_manage_their_capabilities      = my_profile.value.allow_end_users_to_manage_their_capabilities
      allow_end_users_to_update_their_security_settings = my_profile.value.allow_end_users_to_update_their_security_settings
    }
  }

  dynamic "posix_gid" {
    for_each = each.value.posix_gid != null ? [each.value.posix_gid] : []
    content {
      manual_assignment_ends_at     = posix_gid.value.manual_assignment_ends_at
      manual_assignment_starts_from = posix_gid.value.manual_assignment_starts_from
    }
  }

  dynamic "posix_uid" {
    for_each = each.value.posix_uid != null ? [each.value.posix_uid] : []
    content {
      manual_assignment_ends_at     = posix_uid.value.manual_assignment_ends_at
      manual_assignment_starts_from = posix_uid.value.manual_assignment_starts_from
    }
  }

  dynamic "tags" {
    for_each = each.value.tags != null ? each.value.tags : []
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "tokens" {
    for_each = each.value.tokens != null ? each.value.tokens : []
    content {
      expires_after = tokens.value.expires_after
      type          = tokens.value.type
    }
  }
}

