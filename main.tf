data "template_file" "flux_image_policy" {
  template = "${file("${path.module}/templates/podinfo-policy.tmpl")}"
  vars = {
    namespace = "${var.namespace}"
  }
}

data "template_file" "flux_image_registry" {
  template = templatefile("${path.module}/templates/podinfo-registry.tmpl", { namespace = var.namespace, images = var.user_images, interval = "1m" })
  vars     = {}

}

# data "local_file" "flux_image_registry" {
#   filename = "${path.module}/templates/podinfo-registry.tmpl"
#   //templatefile("${path.module}/templates/podinfo-registry.tmpl", { namespace = var.namespace, images = var.user_images, interval = "1m" })
# }

locals {

  test      = templatefile("${path.module}/templates/podinfo-registry.tmpl", { namespace = var.namespace, images = var.user_images, interval = "1m" })
  resources = split("\n---\n", local.test)
}


resource "local_file" "image_repository_manifests" {
    content  = join(" ",local.resources)
    filename = "image_repository_rendered_example.txt"
}