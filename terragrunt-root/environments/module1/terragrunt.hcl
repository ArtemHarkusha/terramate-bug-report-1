locals {
    mock_output = merge([
        for f in fileset("../../config/", "*.yml") : 
            yamldecode(file("../../config/${f}"))
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
