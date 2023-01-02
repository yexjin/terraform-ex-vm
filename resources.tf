# 생성할 클라우드 리소스 작성

## Network ##
resource "openstack_networking_port_v2" "instance" {
  name               = var.instance_name
  network_id         = data.openstack_networking_network_v2.default_network.id
  admin_state_up     = true
  security_group_ids = [openstack_networking_secgroup_v2.instance.id]
}

resource "openstack_networking_floatingip_v2" "instance_fip" {
  pool  = data.openstack_networking_network_v2.floating_network.name
}

resource "openstack_networking_floatingip_associate_v2" "instance_fip_associate" {
  floating_ip = openstack_networking_floatingip_v2.instance_fip.address
  port_id     = openstack_networking_port_v2.instance.id
}


## Security Group ##
resource "openstack_networking_secgroup_v2" "instance" {
  name        = var.instance_name
  description = "description"
}

resource "openstack_networking_secgroup_rule_v2" "instance_ingress_rules" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  security_group_id = openstack_networking_secgroup_v2.instance.id
}


## Block storage ##
resource "openstack_blockstorage_volume_v3" "volume" {
  name = "test-volume"
  description = "first test volume"
  size = 3
}


## Key pair ##
resource openstack_compute_keypair_v2 "test-keypair" {
  name = var.ssh-key
}

resource local_file "key" {
  content = openstack_compute_keypair_v2.test-keypair.private_key
  filename = "./ex-vm-terraform.pem"
  file_permission = "0600"
}