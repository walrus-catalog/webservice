variable "port_mapping_CI" {
  default = [
    {
      name          = "web-access" // (Required) Port name
      internal_port = "8080"       // (Required) Pod port
      external_port = "80"         // (Required) Port for others container's
    },
    {
      name          = "service-port" // (Required) Port name
      internal_port = "3000"         //(Required) Pod port
      external_port = "90"           //(Required) Port for others container's
      portocol      = "UDP"          // (Optional) The IP protocol for this port. Supports TCP and UDP. Default is TCP.
    }
  ]
}

variable "port_mapping_LB" {
  default = [
    {
      name          = "web-access" // (Required) Port name
      internal_port = "8080"       // (Required) Pod port
      external_port = "80"         // (Required) Port for others container's
      node_port     = "30000"      // (Optional) set Node Port. By default K8S automatically set free Node Port
    },
    {
      name          = "service-port" // (Required) Port name
      internal_port = "3000"         // (Required) Pod port
      external_port = "90"           // (Required) Port for others container's
      portocol      = "UDP"          // (Optional) The IP protocol for this port. Supports TCP and UDP. Default is TCP.
    }
  ]
}

variable "port_mapping_NP" {
  default = [
    {
      name          = "web-access" // (Required) Port name
      internal_port = "8080"       // (Required) Pod port
      external_port = "80"         // (Required) Port for others container's
      node_port     = "30000"      // (Optional) set Node Port. By default K8S automatically set free Node Port
    },
    {
      name          = "service-port" // (Required) Port name
      internal_port = "3000"         // (Required) Pod port
      external_port = "90"           // (Required) Port for others container's
      portocol      = "UDP"          // (Optional) The IP protocol for this port. Supports TCP and UDP. Default is TCP.
    }
  ]
}