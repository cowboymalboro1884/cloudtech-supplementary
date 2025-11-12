resource "yandex_iam_service_account" "bucket_sa" {
  name        = "${local.name_prefix}-sa"
  folder_id   = data.yandex_client_config.current.folder_id
  description = "Service account for object storage access"
}

resource "yandex_resourcemanager_folder_iam_member" "bucket_sa_storage_editor" {
  folder_id = data.yandex_client_config.current.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.bucket_sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "bucket_sa_key" {
  service_account_id = yandex_iam_service_account.bucket_sa.id
  description        = "Static access key for ${local.name_prefix} bucket"
}
