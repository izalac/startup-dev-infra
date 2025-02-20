resource "lxd_profile" "general" {
  name = "general"
  description = "General configuration profile"
  config = {
    "cloud-init.vendor-data": <<EOT
