resource "random_string" "suffix" {
  length  = 5
  upper   = false
  special = false
}

locals {
  name_prefix = "${var.project}-${var.env}"
  labels = {
    project = var.project
    env     = var.env
  }
}
