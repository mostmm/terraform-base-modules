resource "helm_release" "default" {
  for_each = var.releases

  name             = each.key
  repository       = each.value.repository
  chart            = each.value.chart
  namespace        = each.value.namespace
  create_namespace = each.value.create_namespace
  version          = each.value.version
  values           = [for key, path in each.value.values : file(path)]

  dynamic "set" {
    for_each = tomap(each.value.set)
    content {
      name  = set.key
      value = set.value
    }
  }

  dynamic "set_sensitive" {
    for_each = tomap(each.value.set_sensitive)
    content {
      name  = set_sensitive.key
      value = set_sensitive.value
    }
  }
}
