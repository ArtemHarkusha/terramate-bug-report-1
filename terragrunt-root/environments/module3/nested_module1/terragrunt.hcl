locals {
   mock_output_from_module1 = read_terragrunt_config("../../module1/terragrunt.hcl")
}

terraform {
  source = "${get_repo_root()}/terragrunt-root/modules/echo"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
    message = local.mock_output_from_module1.locals.mock_output
}
