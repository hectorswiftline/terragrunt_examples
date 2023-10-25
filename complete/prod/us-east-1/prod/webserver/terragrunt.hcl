include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path = "${dirname(find_in_parent_folders())}/_envcommon/webserver.hcl"
}

inputs = {
  instance_type = "t2.micro"

  min_size = 3
  max_size = 3
}