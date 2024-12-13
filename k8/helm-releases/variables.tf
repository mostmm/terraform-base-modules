variable "helm_provider" {
  type = object({
    config_path    = optional(string, "~/.kube/config")
    config_context = optional(string)
  })
}

variable "releases" {
  type = list(object({
    name             = string
    repository       = string
    chart            = string
    version          = optional(string)
    create_namespace = optional(bool, true)
    namespace        = string
    values           = optional(list(string), [])
  }))
}
