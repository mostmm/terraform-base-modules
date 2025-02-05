resource "helm_release" "default" {
  for_each = var.releases

  name             = each.key
  repository       = each.value.repository
  chart            = each.value.chart
  namespace        = each.value.namespace
  create_namespace = each.value.create_namespace
  version          = each.value.version
  values           = [for key, path in each.value.values : file(path)]
}
