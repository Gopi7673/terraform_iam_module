# Create IAM Groups
resource "aws_iam_group" "this" {
  for_each = var.group_user_map
  name     = each.key
}

# Create IAM Users
resource "aws_iam_user" "this" {
  for_each = toset(local.all_users)
  name     = each.key
}

# IAM Policy (Common)
resource "aws_iam_policy" "this" {
  name        = var.policy_name
  description = var.policy_description
  policy      = var.policy_document
}

# Attach policy to each group
resource "aws_iam_group_policy_attachment" "this" {
  for_each   = aws_iam_group.this
  group      = each.value.name
  policy_arn = aws_iam_policy.this.arn
}

# Add users to groups
resource "aws_iam_user_group_membership" "user_grp" {
  for_each = local.user_group_pairs

  user   = aws_iam_user.this[each.value.user].name
  groups = [aws_iam_group.this[each.value.group].name]
}

# Create IAM Roles
resource "aws_iam_role" "this" {
  for_each           = toset(var.role_names)
  name               = each.key
  assume_role_policy = var.assume_role_policy
}

# Attach policy to each role
resource "aws_iam_role_policy_attachment" "this" {
  for_each   = aws_iam_role.this
  role       = each.value.name
  policy_arn = aws_iam_policy.this.arn
}
