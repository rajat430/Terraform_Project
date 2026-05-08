variable "resource_group_name" {
  type        = string
  description = "This is the resource group name"
}

variable "subnet_config" {
  type = map(object({
    address_prefixes = list(string)
    delegation = object({
      name = string
      service_delegation = object({
        name    = string
        actions = list(string)
      })
    })
  }))
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

variable "location" {
  type        = string
  description = "Location of the resource group and modules"
}

variable "prefix" {
  type        = string
  description = "Prefix for module names"
}

variable "environment" {
  type        = string
  description = "Environment information"
}

variable "postfix" {
  type        = string
  description = "Postfix for module names"
}

variable "enable_aml_computecluster" {
  description = "Variable to enable or disable AML compute cluster"
}

variable "enable_monitoring" {
  description = "Variable to enable or disable Monitoring"
}

variable "client_secret" {
  description = "Service Principal Secret"
}
