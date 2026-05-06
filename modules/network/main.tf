# resource "azurerm_resource_group" "example" {
#   name     = "example-resources"
#   location = "West Europe"
# }

resource "azurerm_network_security_group" "example" {
  for_each            = var.subnet_config
  name                = "nsg-${each.value.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
}

resource "azurerm_subnet" "example" {
  for_each             = var.subnet_config
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = each.value.address_prefixes

  delegation {
    name = each.value.delegation.name

    service_delegation {
      name    = each.value.delegation.service_delegation.name
      actions = each.value.delegation.service_delegation.actions
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "example" {
  for_each                  = var.subnet_config
  subnet_id                 = azurerm_subnet.example[each.key].id
  network_security_group_id = azurerm_network_security_group.example[each.key].id
}