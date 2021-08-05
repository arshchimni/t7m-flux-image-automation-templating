output "image_policy" {
  value = data.template_file.flux_image_policy.rendered
}

output "image_registry" {
  value = data.template_file.flux_image_registry.rendered
}

output "image_registry_locals" {
  value = local.resources
}