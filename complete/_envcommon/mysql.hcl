terraform {
  source = "${local.base_source_url}"
}

locals {
    environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    env = local.environment_vars.locals.environment

    base_source_url = "./../../../..//modules/mysql"

}

inputs = {
  name              = "mysql_${local.env}"
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  storage_type      = "standard"
  master_username   = "admin"
  master_password = "test" 
  # TODO: Move this to SOPS
}