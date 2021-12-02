resource "kubernetes_service" "nginx-service" {
  metadata {
    name = "nginx-service-example"
    namespace = var.namespace
  }
  spec {
    selector = {
      App = kubernetes_deployment.nginx-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}