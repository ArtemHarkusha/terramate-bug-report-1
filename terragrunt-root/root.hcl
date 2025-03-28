generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "local" {
    path = "${get_parent_terragrunt_dir()}/.backend/${path_relative_to_include()}/terraform.tfstate"
  }
}
EOF
}
