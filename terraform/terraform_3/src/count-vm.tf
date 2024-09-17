data "yandex_compute_image" "ubuntu" {
  family = var.yandex_image
}

resource "yandex_compute_instance" "default" {
  count       = var.count_vm
  name        = "web-${count.index + 1}"
  platform_id = "standard-v1"
  zone        = var.default_zone
  
    resources {
      cores  = 2
      memory = 4
    }
    
    boot_disk {
      initialize_params {
        image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }

    network_interface {
      subnet_id = yandex_vpc_subnet.develop.id
      security_group_ids = [yandex_vpc_security_group.example.id]
    }
}
