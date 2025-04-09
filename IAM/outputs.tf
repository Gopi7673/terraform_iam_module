output "group_names" {
  value = [for g in aws_iam_group.this : g.name]
}

output "user_names" {
  value = [for u in aws_iam_user.this : u.name]
}

output "policy_arn" {
  value = aws_iam_policy.this.arn
}

output "role_names" {
  value = [for r in aws_iam_role.this : r.name]
}
