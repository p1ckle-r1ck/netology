resource "yandex_compute_disk" "disk" {
    for_each = {
      1 = "1"
      2 = "2"
      3 = "3"
    }
    name = "disk-${each.value}"
    size = 1

}

resource "yandex_compute_instance" "storage" {
    
    name = "storage"

    resources {
        cores = 2
        memory = 2
    }
    boot_disk {
        initialize_params {
        image_id = data.yandex_compute_image.ubuntu.id
      }
    }
    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat = true 
    }
    dynamic "secondary_disk" {
        for_each = yandex_compute_disk.disk 
        content {
            disk_id = secondary_disk.value.id
        }
    }
}
