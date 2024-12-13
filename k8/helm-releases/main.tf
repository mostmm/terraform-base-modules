resource "helm_release" "default" {
  for_each = { for key, release in var.releases : release.name => release }

  name             = each.value.name
  repository       = each.value.repository
  chart            = each.value.chart
  namespace        = each.value.namespace
  create_namespace = each.value.create_namespace
  version          = each.value.version
  values           = [for key, path in each.value.values : file(path)]
}
