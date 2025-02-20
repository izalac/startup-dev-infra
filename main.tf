resource "lxd_instance" "entrysrv" {
  name = "entrysrv"
  image = "ubuntu:noble"
  ephemeral = "false"
  profiles = ["default", lxd_profile.general.name]
}
