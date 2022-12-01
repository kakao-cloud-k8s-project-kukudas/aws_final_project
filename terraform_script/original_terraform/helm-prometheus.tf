resource "helm_release" "prometheus" {
  depends_on = [var.mod_dependency, kubernetes_namespace.prometheus]
  count      = var.enabled ? 1 : 0
  name       = var.helm_chart_prometheus_name
  chart      = var.helm_chart_prometheus_release_name
  repository = var.helm_chart_prometheus_repo
  version    = var.helm_chart_prometheus_version
  namespace  = var.namespace_prometheus

  values = [
    yamlencode(var.settings_prometheus)
  ]

}