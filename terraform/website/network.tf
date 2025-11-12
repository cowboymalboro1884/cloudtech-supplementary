resource "yandex_vpc_network" "this" {
  name   = "${local.name_prefix}-net"
  folder_id = data.yandex_client_config.current.folder_id
  labels = local.labels
}

resource "yandex_vpc_subnet" "this" {
  name           = "${local.name_prefix}-subnet-a"
  zone           = var.zone
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = [var.subnet_cidr]
  labels         = local.labels
}
