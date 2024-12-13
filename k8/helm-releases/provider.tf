provider "helm" {
  kubernetes {
    config_path    = var.helm_provider.config_path
    config_context = var.helm_provider.config_context
  }
}
