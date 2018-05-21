data "ignition_user" "demo" {
  name                = "demo"
  ssh_authorized_keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNfISmQ8sQ+dLkeLCG3n19ykmlulgtcXToCvzVgFKcmO1AQ2kqbT7dYNgSXFvSmzr9vO7Fa36mkUpeUSu24xBdroIxDsLPcs68PgP5kf+2QgV/ginAA2BXPr67nQkjXiVCr/zCz0hp4JEnA1SvayU57I5DfIlE5lSdIU+GFCfVsOAMNrEWkFnFQjDQ2enoftR56Oi74AFhguIQbtoPoaDDvFrbdFJzRAVgAuBOExZ8gL+BpvfCrH+bLVNrexkFpZRH0Lpq8TquoB2kOT4OEhozD2Vf8Fqo9kj0hRyAQ2UD02AbggWVH0PlJvR7B5Es1Gj1DIU1BJlMg7zQ9ztRsPAl root@provisioner-1"]
  groups              = ["sudo", "docker"]
}

output "demo" {
  value = "${data.ignition_user.demo.id}"
}