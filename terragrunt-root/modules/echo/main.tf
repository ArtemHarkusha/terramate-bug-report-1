variable "message" {
  type = string
  default = "loaded from default values"
}

output "message" {
  value = var.message
}
