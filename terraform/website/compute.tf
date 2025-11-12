data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "web" {
  name        = "${local.name_prefix}-vm"
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores  = var.vm_cores
    memory = var.vm_memory_gb
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.vm_disk_size_gb
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.this.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.vm.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
    user-data = <<-EOT
      #cloud-config
      packages:
        - nginx
      runcmd:
        - systemctl enable --now nginx
    EOT
  }

  labels = local.labels
}
