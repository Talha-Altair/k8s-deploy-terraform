resource "kubernetes_service" "nginx-service" {
  metadata {
    name      = "nginx-service-example"
    namespace = var.namespace
  }
  spec {
    selector = {
      test = "nginx"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
