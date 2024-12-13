variable "account_vars" {
  type = map(string)
}

variable "region_vars" {
  type = map(string)
}

variable "echo" {
  type = string
}

output "out" {
  value = {
    account_vars = var.account_vars
    region_vars  = var.region_vars
    echo         = var.echo
  }
}
