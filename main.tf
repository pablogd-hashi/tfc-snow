# main.tf

resource "random_pet" "server" {
  keepers = {
    uuid = "${uuid()}"
  }

  length = "${var.pet_name_length}"
}