output "output_image_name" {
  value = openstack_compute_instance_v2.instance.image_name
}

output "output_image_id" {
  value = openstack_compute_instance_v2.instance.image_id
}

output "ssh_file" {
  value = local_file.key.filename
}

output "current_workspace_name" {
  value = terraform.workspace
}
