To reproduce

1. `cd terragrunt-root`

2. `terramate create --all-terragrunt`

Woraround

1. use `get_repo_root()` in `terragrunt-root/environments/module1/terragrunt.hcl` instead of relative paths
2. move terragrunt root to repo root (`mv terragrunt-root/* ./`)

