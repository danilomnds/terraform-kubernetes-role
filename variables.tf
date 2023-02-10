variable "namespaces" {
  type = list(any)
}

variable "suffix_role" {
  type    = string
  default = null
}

variable "rules" {
  type = any
  default = {
    rule1 = {
      api_groups = ["", "apps", "extensions", "autoscaling", "networking.k8s.io","batch","policy"]
      resources  = ["bindings", "configmaps","cronjobs", "daemonsets", "deployments", "deployments/scale", "endpoints", "endpointslices", "events", "healthstates", "horizontalpodautoscalers", "hostendpoints", "imagesets", "ingressclasses", "ingresses", "limitranges", "jobs", "jobs/status", "persistentvolumeclaims", "pods", "pods/log", "pods/exec", "pods/portforward", "podtemplates", "replicasets", "replicationcontrollers", "secrets", "serviceaccounts", "services", "statefulsets","poddisruptionbudgets"]
      verbs      = ["*"]
    }
    rule2 = {
      api_groups = ["rbac.authorization.k8s.io"]
      resources  = ["roles", "rolebindings"]
      verbs      = ["get", "list"]
    }
    rule3 = {
      api_groups = [""]
      resources  = ["resourcequotas"]
      verbs      = ["get", "list"]
    }
  }
}