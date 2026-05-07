module "name" {
  source               = "../../modules/network"
  virtual_network_name = var.virtual_network_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  subnet_config        = var.subnet_config
}