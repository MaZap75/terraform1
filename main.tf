provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_pod" "example_pod" {
  metadata {
    name      = "my-app-pod-git-17-06-2025"
    namespace = "test"
  }

  spec {
    container {
      name  = "container-by-terraform"
      image = "docker.io/centos/httpd-24-centos7@sha256:001ec5d1b463d8d62c87b11ef9ca64603e6dd2eb88edadcb4f70f1c593aa83af"
      port {
        container_port = 8080
      }
    }  
  } 
}

# Creazione del Service per il pod
resource "kubernetes_service" "example_service" {
  metadata {
    name      = "my-app-service"
    namespace = "test"
  }
  spec {
    selector = {
      name = "my-app-pod-git-17-06-2025"
    }
    port {
      port        = 8080
      target_port = 8080
    }
    type = "ClusterIP" # Cambia in "NodePort" o "LoadBalancer" se necessario
  }
}



