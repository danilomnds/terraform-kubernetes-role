resource "kubernetes_role" "role" {
  for_each = toset(var.namespaces)
  metadata {
    name      = var.suffix_role == null ? ("role-${each.value}") : ("role-${each.value}-${var.suffix_role}")
    namespace = each.value
  }
  dynamic "rule" {
    for_each = var.rules
    content {
      api_groups     = rule.value.api_groups
      resources      = rule.value.resources
      resource_names = try(rule.value.resource_names, null)
      verbs          = rule.value.verbs
    }
  }
}