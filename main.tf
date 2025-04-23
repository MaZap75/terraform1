provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_pod" "example_pod" {
  metadata {
    name      = "my-app-pod_1"
    namespace = "test"
  }

  spec {
    container {
      name  = "container-by-terraform"
      image = "sha256:001ec5d1b463d8d62c87b11ef9ca64603e6dd2eb88edadcb4f70f1c593aa83af"  # Immagine pubblica da Docker Hub digest
      port {
        container_port = 80
      }
    }
  }
}
