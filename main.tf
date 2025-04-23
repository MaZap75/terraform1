provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_pod" "example_pod" {
  metadata {
    name      = "my-app-pod"
    namespace = "test"
  }

  spec {
    container {
      name  = "container-by-terraform"
      image = "nginx:latest"  # Immagine pubblica da Docker Hub
      port {
        container_port = 80
      }
    }
  }
}
