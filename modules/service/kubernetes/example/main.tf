# Example with ClusterIP
module "service_jenkins_ClusterIP" {
  source        = "../"
  app_name      = "jenkins1"
  app_namespace = "jenkins1"
  port_mapping  = var.port_mapping_CI
}

# Example with Load Balancer
module "service_jenkins_LB" {
  source           = "../"
  app_name         = "jenkins2"
  app_namespace    = "jenkins2"
  port_mapping     = var.port_mapping_LB
  type             = "LoadBalancer"
  load_balancer_ip = "134.13.13.24" // Also you can get from google_compute_address.static_external_ip.address
  load_balancer_ips_whitelist = [
    "10.10.10.0/24",
    "34.23.145.91/32"
  ]
}

# Example with Node Port
module "service_jenkins_NP" {
  source        = "../"
  app_name      = "jenkins3"
  app_namespace = "jenkins3"
  port_mapping  = var.port_mapping_NP
  type          = "NodePort"
}