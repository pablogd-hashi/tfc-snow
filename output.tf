# output.tf

output "server" {
  value = "${random_pet.server.id}"
}