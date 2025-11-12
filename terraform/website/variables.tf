variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Folder ID"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "website"
}

variable "env" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.20.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
  default     = "10.20.1.0/24"
}

variable "ssh_public_key" {
  description = "Public SSH key content (single line)"
  type        = string
}

variable "vm_cores" {
  type    = number
  default = 2
}

variable "vm_memory_gb" {
  type    = number
  default = 2
}

variable "vm_disk_size_gb" {
  type    = number
  default = 20
}

variable "pg_version" {
  type    = string
  default = "14"
}

variable "pg_resource_preset_id" {
  description = "PostgreSQL preset (vCPU/RAM)"
  type        = string
  default     = "s2.micro"
}

variable "pg_disk_size_gb" {
  type    = number
  default = 20
}

variable "pg_database_name" {
  type    = string
  default = "appdb"
}

variable "pg_user_name" {
  type    = string
  default = "appuser"
}
