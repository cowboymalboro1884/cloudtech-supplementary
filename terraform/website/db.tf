resource "random_password" "pg_password" {
  length  = 20
  special = false
}

resource "yandex_mdb_postgresql_cluster" "this" {
  name               = "${local.name_prefix}-pg"
  environment        = "PRODUCTION"
  network_id         = yandex_vpc_network.this.id
  security_group_ids = [yandex_vpc_security_group.db.id]

  config {
    version = var.pg_version
    resources {
      resource_preset_id = var.pg_resource_preset_id
      disk_type_id       = "network-ssd"
      disk_size          = var.pg_disk_size_gb
    }
  }

  host {
    zone              = var.zone
    subnet_id         = yandex_vpc_subnet.this.id
    assign_public_ip  = false
  }

  maintenance_window {
    type = "ANYTIME"
  }

  labels = local.labels
}

resource "yandex_mdb_postgresql_database" "db" {
  cluster_id = yandex_mdb_postgresql_cluster.this.id
  name       = var.pg_database_name
  owner      = yandex_mdb_postgresql_user.user.name
}

resource "yandex_mdb_postgresql_user" "user" {
  cluster_id = yandex_mdb_postgresql_cluster.this.id
  name       = var.pg_user_name
  password   = random_password.pg_password.result
}
