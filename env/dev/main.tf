module "name" {
  source               = "../../modules/network"
  virtual_network_name = var.virtual_network_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  subnet_config        = var.subnet_config
  prefix               = var.prefix
  postfix              = var.postfix
  env                  = var.environment
}

module "aml_workspace" {
  source = "../../modules/aml-workspace"

  rg_name  = var.resource_group_name
  location = var.location

  prefix  = var.prefix
  postfix = var.postfix
  env     = var.environment

  storage_account_id      = module.storage_account_aml.id
  key_vault_id            = module.key_vault.id
  application_insights_id = module.application_insights.id
  container_registry_id   = module.container_registry.id

  enable_aml_computecluster = var.enable_aml_computecluster
  storage_account_name      = module.storage_account_aml.name

}

# Storage account

module "storage_account_aml" {
  source = "../../modules/storage-account"

  rg_name  = var.resource_group_name
  location = var.location

  prefix  = var.prefix
  postfix = var.postfix
  env     = var.environment

  hns_enabled                         = false
  firewall_bypass                     = ["AzureServices"]
  firewall_virtual_network_subnet_ids = []
}

# Key vault

module "key_vault" {
  source = "../../modules/key-vault"

  rg_name  = var.resource_group_name
  location = var.location

  prefix  = var.prefix
  postfix = var.postfix
  env     = var.environment
}

# Application insights

module "application_insights" {
  source = "../../modules/application-insights"

  rg_name  = var.resource_group_name
  location = var.location

  prefix  = var.prefix
  postfix = var.postfix
  env     = var.environment
}

# Container registry

module "container_registry" {
  source = "../../modules/container-registry"

  rg_name  = var.resource_group_name
  location = var.location

  prefix  = var.prefix
  postfix = var.postfix
  env     = var.environment

}

module "data_explorer" {
  source = "../../modules/data-explorer"

  rg_name  = var.resource_group_name
  location = var.location

  prefix            = var.prefix
  postfix           = var.postfix
  env               = var.environment
  key_vault_id      = module.key_vault.id
  enable_monitoring = var.enable_monitoring

  client_secret = var.client_secret
}
