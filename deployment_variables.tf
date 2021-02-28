variable "container_version" {
  type = string
}

variable "build" {}

output "dns_name" {
  value = module.deployment.alb_dns_name
}