data "yandex_client_config" "current" {}

variable "zone" {
  description = "Default availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "token" {
  description = "IAM token for Yandex Cloud"
  type        = string
  sensitive   = true
}

provider "yandex" {
  token     = var.token
  zone      = var.zone
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}
