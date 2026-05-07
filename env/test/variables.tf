variable "resource_group_name" {
  type        = string
  description = "This is the resource group name"
}

variable "subnet_config" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
    nsg_name= string
    delegation = object({
      name = string
      service_delegation = object({
        name    = string
        actions = list(string)
      })
    })
  }))
}

variable "location" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "dns_servers" {
  type = list(string)
}