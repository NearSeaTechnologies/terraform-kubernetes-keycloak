resource "kubernetes_horizontal_pod_autoscaler" "consumer" {
  count = var.autoscaling == null ? 0 : 1

  metadata {
    name      = var.name
    namespace = var.namespace
  }

  spec {
    max_replicas = var.autoscaling.max_replicas
    min_replicas = var.autoscaling.min_replicas

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "StatefulSet"
      name        = var.name
    }
  }
}