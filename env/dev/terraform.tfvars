
resource_group_name = "1-353263ee-playground-sandbox"
subnet_config = {
  "0" = {
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
  },
  "1" = {

    address_prefixes = ["10.0.2.0/24"]
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


virtual_network_name = "dev-vnet01"
address_space        = ["10.0.0.0/16"]
dns_servers          = ["10.0.0.4", "10.0.0.5"]
location                  = "westus"
prefix                    = "prefix"
postfix                   = "postfix"
environment               = "dev"
enable_aml_computecluster = true
enable_monitoring         = true