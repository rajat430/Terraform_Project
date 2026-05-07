terraform {
  backend "azurerm" {
    use_azuread_auth = true # Can also be set via `ARM_USE_AZUREAD` environment variable.
    # tenant_id            = ""     # Can also be set via `ARM_TENANT_ID` environment variable.
    # client_id            = ""     # Can also be set via `ARM_CLIENT_ID` environment variable.
    # client_secret        = "" # Can also be set via `ARM_CLIENT_SECRET` environment variable.
    storage_account_name = "stgaccounttfstateacc001" # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                 # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {

  }

  # subscription_id = ""
  # tenant_id       = ""
  # client_id       = ""
  # client_secret   = ""
}