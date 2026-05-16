# High Priority Class
resource "kubernetes_priority_class_v1" "high_priority" {

  metadata {

    name = "high-priority"
  }

  value = 100000

  global_default = false

  description = "High priority workloads"
}

# Critical Priority Class
resource "kubernetes_priority_class_v1" "critical_priority" {

  metadata {

    name = "critical-priority"
  }

  value = 1000000

  global_default = false

  description = "Critical workloads"
}

