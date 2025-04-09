# terraform_iam_module

This Terraform module helps you easily create and manage IAM Groups, Users, Roles, and Policies in AWS.

**What This Module Does?**
Creates IAM Groups and Users, and adds users to the correct groups.
Creates a custom IAM Policy and attaches it to all the groups.
Creates IAM Roles and attaches the same policy to them.

🧱 Folder Structure.
├── main.tf

├── variables.tf

├── locals.tf

├── outputs.tf (optional)

├── policies/

│   ├── devops-policy.json

│   └── assume-role-policy.json



**📌 How to Use This Modul**e
  Write your root Terraform file (e.g., main.tf), use the module like this:

module "iam" {
  source = "./IAM"  # Path to the module folder
  group_user_map = {
    "devops-team"   = ["Name-1", "Name-2"]
    "qa-team"       = ["Name"]
    "testing-team"  = ["Name"]
  }
  policy_name        = "TeamAccessPolicy"
  policy_description = "Policy for all teams"
  policy_document    = file("policies/devops-policy.json")
  role_names         = ["DevOpsRole", "QARole"]
  assume_role_policy = file("policies/assume-role-policy.json")
}


📥 Input Variables
**Name	              Type	                    Description**
group_user_map	    map(list(string))	    Map of group names to user names
policy_name	        string	              Name for the IAM policy
policy_description	string	              Description of the policy
policy_document	    string	              JSON content of the policy as a string
role_names	        list(string)	        List of IAM roles to create
assume_role_policy	string	              JSON string of the assume role trust policy


**📤 Outputs**
You can optionally add outputs to see created users, groups, roles, etc. Example:

output "iam_users" {
  value = [for user in aws_iam_user.this : user.name]
}


**✅ Steps to Use**
Create the JSON policies in the policies/ folder:
devops-policy.json: your main access policy.
assume-role-policy.json: trust policy for roles.

Run Terraform commands:
terraform init
terraform plan
terraform apply

Done! 🎉 IAM resources will be created as per your config.
