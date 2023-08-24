terraform -version


az login

RESOURCE_GROUP_NAME=tf-state-rg
STORAGE_ACCOUNT_NAME=tfstatebode
CONTAINER_NAME=tfstate

# Create resource group
az group create --name tf-state-rg --location uksouth

# Create storage account
az storage account create --name $STORAGE_ACCOUNT_NAME --location uksouth --resource-group $RESOURCE_GROUP_NAME

# Get storage account key
$ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

# Create blob container
az storage container create --account-name $STORAGE_ACCOUNT_NAME --name $CONTAINER_NAME --public-access off --account-key $ACCOUNT_KEY

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"