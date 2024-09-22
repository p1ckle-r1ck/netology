resource "yandex_compute_instance" "database" {
    for_each = {
        1 = "main"
        2 = "replica"
    }
    name = each.value
    resources {
        cores  = each.value == "main" ? var.each_vm.main.cpu : var.each_vm.replica.cpu
        memory = each.value == "main" ? var.each_vm.main.ram : var.each_vm.replica.ram

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
    
    metadata = {
      ssh-keys           = "ubuntu:${local.ssh-key}"
    }
}