resource "random_string" "this" {
  length      = var.length
  lower       = var.lower
  numeric     = var.numeric
  special     = var.special
  upper       = var.upper
  min_lower   = var.min_lower
  min_numeric = var.min_numeric
}

