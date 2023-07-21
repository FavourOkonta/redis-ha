provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # must define the correct place to k8s
  }
}

data "helm_repository" "bitnami" {
  name = "bitnami"
  url  = "https://charts.bitnami.com/bitnami"
}

resource "helm_release" "my_redis" {
  name       = "my-redis"
  repository = data.helm_repository.bitnami.metadata[0].name
  chart      = "redis"
  version    = "14.1.1"

  set {
    name  = "cluster.enabled"
    value = "true"
  }

  set {
    name  = "sentinel.enabled"
    value = "true"
  }

  set {
    name  = "password"
    value = "secretpassword" # password
  }
}
