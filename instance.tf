# 생성할 인스턴스 정보
resource "openstack_compute_instance_v2" "instance" {
  name = var.instance_name
  image_id = data.openstack_images_image_v2.default_image.id
  flavor_name = var.instance_flavor
  key_pair = openstack_compute_keypair_v2.test-keypair.name

  block_device {
    uuid                  = data.openstack_images_image_v2.default_image.id
    source_type           = "image"
    boot_index            = 0
    destination_type      = "local"
  }

  block_device {
    source_type = "blank"
    destination_type = "volume"
    volume_size = openstack_blockstorage_volume_v3.volume.size
    boot_index = 1
    delete_on_termination = true
  }

  network {
    port = openstack_networking_port_v2.instance.id
  }
}

