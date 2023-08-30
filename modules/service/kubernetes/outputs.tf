# K8S Resource id
output "id" {
  value = kubernetes_service.service.id
}

# K8S Service Name
output "name" {
  value = kubernetes_service.service.metadata[0].name
}
output "namespace" {
  value = kubernetes_service.service.metadata[0].namespace
}

# Ports
output "node_ports" {
  value = kubernetes_service.service.spec[0].port[*].node_port
}