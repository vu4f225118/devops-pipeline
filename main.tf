
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "C:/Users/HP/.kube/config"
}

resource "kubernetes_namespace_v1" "devops" {
  metadata {
    name = "devops-terraform"
  }
}

resource "kubernetes_deployment_v1" "app" {
  metadata {
    name      = "devops-demo-terraform"
    namespace = kubernetes_namespace_v1.devops.metadata[0].name
    labels = {
      app = "devops-demo-terraform"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "devops-demo-terraform"
      }
    }

    template {
      metadata {
        labels = {
          app = "devops-demo-terraform"
        }
      }

      spec {
        container {
          name              = "devops-demo"
          image             = "devops-demo:3"
          image_pull_policy = "IfNotPresent"

          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "app" {
  metadata {
    name      = "devops-demo-terraform-service"
    namespace = kubernetes_namespace_v1.devops.metadata[0].name
  }

  spec {
    selector = {
      app = "devops-demo-terraform"
    }

    port {
      port        = 5000
      target_port = "5000"
    }

    type = "ClusterIP"
  }
}
