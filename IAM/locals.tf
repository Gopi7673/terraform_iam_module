locals {
  all_users = distinct(flatten([for _, users in var.group_user_map : users]))

  user_group_pairs = merge([
    for group, users in var.group_user_map : {
      for user in users : "${group}-${user}" => {
        group = group
        user  = user
      }
    }
  ]...)
}
