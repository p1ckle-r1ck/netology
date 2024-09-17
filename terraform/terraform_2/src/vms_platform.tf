
variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_db_yandex_image"{
  type        = string
  default     = "ubuntu-2004-lts"
}

# variable "vm_db_yandex_compute_instance_1" {
#   type = object({
#     name = string
#     platform_id = string
#     cores         = number
#     memory        = number
#     core_fraction = number
#   })
#   default = {
#     name = "netology-develop-platform-db"
#     platform_id = "standard-v1"
#     cores = 2
#     memory = 2
#     core_fraction = 20
#   }
# }

variable "vm_db_scheduling_policy" {
  type = bool
  default = true
}

variable "vm_db_network_interface_nat" {
  type = bool
  default = true
}


variable "vm_db_metadata_number" {
  type = number
  default = 1
  
}
###ssh vars

variable "vm_db_vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG5Kzn0xA3mea/L/yEJX4NyNxAD/1HZE79V+HF+1kqP5 marsel.valiev@MacBook-Air-Marsel.local"
  description = "ssh-keygen -t ed25519"
}
