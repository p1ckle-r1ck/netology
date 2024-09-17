resource "yandex_compute_instance" "database" {
    for_each = {
        1 = "main"
        2 = "replica"
    }
    name = each.key
    resources {

        cores  = 2
        memory = 4

    }

    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.ubuntu.id
            }
        }
    
    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
    }
}