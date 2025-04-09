module "iam" {
  source             = "./IAM"

  group_user_map     = {
    "devops-team" = ["GOPI", "VISHNU"]
    "qa-team"     = ["ARUN"]
    "testing-team" = ["venu"]
      }

  policy_name        = "TeamAccessPolicy"
  policy_description = "Policy for all teams"
  policy_document    = file("policies/devops-policy.json")

  role_names         = ["DevOpsRole", "QARole"]
  assume_role_policy = file("policies/assume-role-policy.json")
}