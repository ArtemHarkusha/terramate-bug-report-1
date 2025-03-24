locals {
    gitlab_users = merge([
        for f in fileset("../../config/", "*.yml") : {
        for m in yamldecode(file("../../config/${f}")) : u
        }
    ]...)
    yml = yamldecode(file("../../config/first.yml"))
}

terraform {
  source = "${get_repo_root()}/terragrunt-root/modules/echo"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
    message = local.yml.message
}
