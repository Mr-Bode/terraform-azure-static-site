# Create a resource group
resource "azurerm_resource_group" "tf-resource-group" {
  name     = var.resource_group_name
  location = var.location
}

# Create a storage account
resource "azurerm_storage_account" "tf-storage-account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tf-resource-group.name
  location                 = azurerm_resource_group.tf-resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  static_website {
    index_document = "index.html"
  }
}

# Add a index.html file
resource "azurerm_storage_blob" "tf-blob" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.tf-storage-account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = var.source_content
}