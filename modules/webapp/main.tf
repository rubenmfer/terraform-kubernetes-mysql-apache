resource "kubernetes_deployment" "miwebapp" {
  metadata {
    name = var.name
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.name
      }
    }

    template {
      metadata {
        labels = {
          app = var.name
        }
      }

      spec {
        container {
          image = var.imgdocker
          name  = var.name
          image_pull_policy = "IfNotPresent"

          port {
            container_port = var.port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "miwebapp" {
  metadata {
    name = var.name
  }
  spec {
    selector = {
        app = var.name
    }
    port {
        protocol = var.portprotocol
        port = var.port
        target_port = var.port
    }
  }
}