# Variables
$location = "westus"
$resourceGroup = "1-0952f854-playground-sandbox"
$environments = @("dev", "test", "acc", "prod")

# Login to Azure (if not already logged in)
az login

foreach ($env in $environments) {

    # Storage account name must be globally unique and lowercase
    $storageAccountName = "stgaccounttfstate$env"+"001"

    Write-Host "Creating storage account: $storageAccountName"

    # Create Storage Account
    az storage account create `
      --name $storageAccountName `
      --resource-group $resourceGroup `
      --location $location `
      --sku Standard_LRS `
      --encryption-services blob `
      --kind StorageV2

    # Get storage account key
    $accountKey = az storage account keys list `
      --resource-group $resourceGroup `
      --account-name $storageAccountName `
      --query "[0].value" -o tsv

    # Create container for Terraform state
    az storage container create `
      --name "tfstate" `
      --account-name $storageAccountName `
      --account-key $accountKey

    Write-Host "Storage account and container created for $env"
}