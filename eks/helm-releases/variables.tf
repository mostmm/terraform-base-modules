variable "helm_provider" {
  type = object({
    config_path    = optional(string, "~/.kube/config")
    config_context = optional(string)
  })
}

variable "helm_releases" {
  type = list(object({
    name       = string
    repository = string
    chart      = string
    version    = optional(string)
    namespace  = string
    values     = optional(list(string), [])
  }))
}
