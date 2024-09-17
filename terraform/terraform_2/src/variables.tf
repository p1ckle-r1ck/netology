###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr-1" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "default_cidr-2" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vpc_name-1" {
  type        = string
  default     = "develop-1"
  description = "VPC network & subnet name"
}

variable "vpc_name-2" {
  type        = string
  default     = "develop-2"
  description = "VPC network & subnet name"
}

variable "yandex_image"{
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "yandex_compute_instance_1" {
  type = map(object({
    name = string
    platform_id = string
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    "web" = {
      name = "netology-develop-platform-web"
      platform_id = "standard-v1"
      cores = 2
      memory = 1
      core_fraction = 5
    }
    "db" = {
      name = "netology-develop-platform-db"
      platform_id = "standard-v1"
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}

variable "scheduling_policy" {
  type = bool
  default = true
}

variable "network_interface_nat" {
  type = bool
  default = true
}

variable "metadata_number" {
  type = map(object({
    meta_number = number

  }))
  default = {
      
      "web" = {
      meta_number = 1
        }
      
      "db" = {
      meta_number = 1
        }
    }
  
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG5Kzn0xA3mea/L/yEJX4NyNxAD/1HZE79V+HF+1kqP5 marsel.valiev@MacBook-Air-Marsel.local"

}

