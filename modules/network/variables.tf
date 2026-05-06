variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "dns_servers" {
  type    = list(string)
  default = ["10.0.0.4", "10.0.0.5"]
}


variable "subnet_config" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
    delegation = object({
      name = string
      service_delegation = object({
        name    = string
        actions = list(string)
      })
    })
  }))

  default = {
    subnet1 = {
      name             = "subnet-01"
      address_prefixes = ["10.0.1.0/24"]
      delegation = {
        name = "delegation"
        service_delegation = {
          name = "Microsoft.ContainerInstance/containerGroups"
          actions = [
            "Microsoft.Network/virtualNetworks/subnets/join/action",
            "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"
          ]
        }
      }
    }
  }
}