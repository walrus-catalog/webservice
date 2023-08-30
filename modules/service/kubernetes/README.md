Terraform module for Kubernetes Service
==========================================

## Usage (more in example direcotry)

With default labels, selector finds pods with `app` label which equal to `app_name`

### Example with ClusterIP
```
module "service_jenkins_ClusterIP" {
  source = "../"
  
  app_name      = "jenkins1"
  app_namespace = "jenkins1"
  port_mapping  = var.port_mapping_CI
}
```

### Example with Load Balancer
```
module "service_jenkins_LB" {
  source = "../"
  app_name         = "jenkins2"
  app_namespace    = "jenkins2"
  port_mapping     = var.port_mapping_LB
  type             = "LoadBalancer"
  
  load_balancer_ip            = "134.13.13.24" // This field will be ignored if the cloud-provider does not support the feature
  load_balancer_ips_whitelist = [
    "10.10.10.0/24",
    "34.23.145.91/32"
  ]
}
```
### Example with Node Port
```
module "service_jenkins_NP" {
  source = "../"
  
  app_name      = "jenkins3"
  app_namespace = "jenkins3"
  port_mapping  = var.port_mapping_NP
  type          = "NodePort"
}
```


## Terraform Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |
| kubernetes | >= 2.0.0 |

## Inputs
See in example directory & variables.tf

## Outputs
| Name       |              Description               |
|------------|:--------------------------------------:|
| name       |          Name of the service           |
| namespace  | Namespace in which created the service |
| id         |         Kubernetes resource id         |
| node_ports |   All Node Ports generated & entered   |