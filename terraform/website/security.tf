resource "yandex_vpc_security_group" "vm" {
  name        = "${local.name_prefix}-vm-sg"
  description = "Allow SSH and HTTP to VM"
  network_id  = yandex_vpc_network.this.id
  labels      = local.labels

  ingress {
    description    = "SSH"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "HTTP"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description    = "All egress"
    protocol       = "ANY"
    from_port      = 0
    to_port        = 65535
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_vpc_security_group" "db" {
  name        = "${local.name_prefix}-db-sg"
  description = "Allow Postgres from VM SG"
  network_id  = yandex_vpc_network.this.id
  labels      = local.labels

  ingress {
    description      = "PostgreSQL from VM SG"
    protocol         = "TCP"
    port             = 5432
    security_group_id = yandex_vpc_security_group.vm.id
  }

  egress {
    description    = "All egress"
    protocol       = "ANY"
    from_port      = 0
    to_port        = 65535
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
