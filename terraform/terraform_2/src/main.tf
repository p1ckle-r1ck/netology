resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop-1" {
  name           = var.vpc_name-1
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr-1
}

resource "yandex_vpc_subnet" "develop-2" {
  name           = var.vpc_name-2
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr-2
}

data "yandex_compute_image" "ubuntu" {
  family = var.yandex_image
}

resource "yandex_compute_instance" "platform" {
  name        = "${local.instance_name_1}${var.yandex_compute_instance_1.web.name}"
  platform_id = var.yandex_compute_instance_1.web.platform_id

  resources {
    cores         = var.yandex_compute_instance_1.web.cores
    memory        = var.yandex_compute_instance_1.web.memory
    core_fraction = var.yandex_compute_instance_1.web.core_fraction
    
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.scheduling_policy
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-1.id
    nat       = var.network_interface_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}



resource "yandex_compute_instance" "netology-develop-platform-db" { 
  name        = "${local.instance_name_2}${var.yandex_compute_instance_1.db.name}"
  platform_id = var.yandex_compute_instance_1.db.platform_id
  zone        = var.vm_db_default_zone

  resources {
    cores         = var.yandex_compute_instance_1.db.cores
    memory        = var.yandex_compute_instance_1.db.memory
    core_fraction = var.yandex_compute_instance_1.db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_scheduling_policy
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-2.id
    nat       = var.vm_db_network_interface_nat
  }

  metadata = {
    serial-port-enable = var.metadata_number.db.meta_number
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}