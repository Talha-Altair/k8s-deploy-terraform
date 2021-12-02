provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = var.config_context
}

resource "kubernetes_namespace" "altair" {
  metadata {
    name = var.namespace
  }
}

