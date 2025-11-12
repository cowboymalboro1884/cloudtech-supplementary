resource "yandex_storage_bucket" "this" {
  bucket = "${local.name_prefix}-${random_string.suffix.result}"
}
