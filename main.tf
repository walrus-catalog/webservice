terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

module "deployment" {
  # disable wait for all pods be ready.
  #
  wait_for_rollout = false

  # always pull latest version avoid fake updating.
  #
  image_pull_policy = "Always"

  # Use local paths to avoid accessing external networks
  # This module comes from terraform registry "terraform-iaac/deployment/kubernetes 1.4.2"
  source = "./modules/deployment/kubernetes"

  name      = local.name
  namespace = local.namespace
  image     = var.image
  replicas  = var.replicas
  resources = {
    request_cpu    = var.request_cpu == "" ? null : var.request_cpu
    limit_cpu      = var.limit_cpu == "" ? null : var.limit_cpu
    request_memory = var.request_memory == "" ? null : var.request_memory
    limit_memory   = var.limit_memory == "" ? null : var.limit_memory
  }
  env = var.env
}

module "service" {

  # Use local paths to avoid accessing external networks
  # This module comes from terraform registry "terraform-iaac/service/kubernetes 1.0.4"
  source = "./modules/service/kubernetes"

  app_name      = local.name
  app_namespace = local.namespace
  type          = "NodePort"
  port_mapping = [for p in var.ports :
    {
      name          = "port-${p}"
      internal_port = p
      external_port = p
      protocol      = "TCP"
  }]
}

data "kubernetes_service" "service" {
  depends_on = [module.service]

  metadata {
    name      = local.name
    namespace = local.namespace
  }
}

locals {
  name      = coalesce(try(var.name, null), try(var.walrus_metadata_service_name, null), try(var.context["resource"]["name"], null))
  namespace = coalesce(try(var.namespace, null), try(var.walrus_metadata_namespace_name, null), try(var.context["environment"]["namespace"], null))
}
