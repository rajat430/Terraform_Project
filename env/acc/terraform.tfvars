resource_group_name = "1-0952f854-playground-sandbox"
subnet_config = {
  "subnet1" = {
    name             = "subnet-01"
    address_prefixes = ["10.0.1.0/24"]
    nsg_name         = "nsg-acc-subnet-01"
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
  "subnet2" = {
    name             = "subnet-02"
    address_prefixes = ["10.0.2.0/24"]
    nsg_name         = "nsg-acc-subnet-02"
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

location             = "westus"
virtual_network_name = "acc-vnet01"
address_space        = ["10.0.0.0/16"]
dns_servers          = ["10.0.0.4", "10.0.0.5"]