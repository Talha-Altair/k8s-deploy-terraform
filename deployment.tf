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
          image = "nginx:1.7.8"
          name  = "nginx"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
