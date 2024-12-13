resource "helm_release" "default" {
  for_each = { for key, release in var.helm_releases : release.name => release }

  name             = each.value.name
  repository       = each.value.repository
  chart            = each.value.chart
  namespace        = each.value.namespace
  create_namespace = true
  version          = each.value.version
  values           = each.value.values
}
