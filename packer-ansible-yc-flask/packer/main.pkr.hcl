# Required Packer plugins
packer {
  required_plugins {
    yandex = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/yandex"
    }
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}

variable "ya_cloud_iam_token" {
  type    = string
  default = env("YC_IAM_TOKEN")
}

source "yandex" "ubuntu-nginx" {
  token = var.ya_cloud_iam_token
  folder_id           = "b1gpn6renldvhntu829h"
  source_image_family = "ubuntu-2004-lts"
  ssh_username        = "ubuntu"
  use_ipv4_nat        = "true"
  image_description   = "flask-app-nginx"
  image_family        = "ubuntu-2004-lts"
  image_name          = "my-flask-app"
  subnet_id           = "e2l19hg5eoctb298l5if"
  disk_type           = "network-ssd"
  zone                = "ru-central1-b"
}

build {
  name = "flask-app-build"
  sources = ["source.yandex.ubuntu-nginx"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y python3 python3-pip",
      "sudo pip3 install ansible"
    ]
  }

  provisioner "ansible-local" {
    playbook_file   = "../ansible/playbook.yml"
    role_paths      = [
      "../ansible/roles/app",
      "../ansible/roles/nginx"
    ]
    extra_arguments = [
      "--extra-vars", 
      "ansible_python_interpreter=/usr/bin/python3"
    ]
  }

  post-processor "manifest" {
    output = "manifest.json"
    strip_path = true
  }
}
