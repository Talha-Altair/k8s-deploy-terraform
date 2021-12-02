resource "kubernetes_deployment_v1" "nginx-deployment" {
  metadata {
    name = "terraform-nginx-example"
    labels = {
      test = "nginx"
    }
    namespace = var.namespace
  }

  spec {

    replicas = 3

    selector {
      match_labels = {
        test = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          test = "nginx"
        }
      }

      spec {
        container {
          image = "docker.io/nginx"
          name  = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
