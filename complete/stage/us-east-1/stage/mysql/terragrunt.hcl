include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/mysql.hcl"
}

locals {
  db_creds = yamldecode(sops_decrypt_file(("../secrets-encrypt.yaml")))
}

inputs = {
  username = local.db_creds.master_username
  password = local.db_creds.master_password
}