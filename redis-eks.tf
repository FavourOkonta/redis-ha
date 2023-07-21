provider "kubernetes" {
  config_path = "~/.kube/config" # seu arquivo de configuração do Kubernetes pode estar em um local diferente
}

resource "kubernetes_namespace" "redis" {
  metadata {
    name = "redis"
  }
}

resource "kubernetes_deployment" "redis" {
  metadata {
    name = "redis"
    namespace = kubernetes_namespace.redis.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        App = "redis"
      }
    }

    template {
      metadata {
        labels = {
          App = "redis"
        }
      }

      spec {
        container {
          image = "redis:5.0.3-alpine"
          name  = "redis"
        }
      }
    }
  }
}
