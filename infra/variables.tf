variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Storage Account."
}

variable "storage_account_name" {
  description = "The name of the Storage Account to create."
}

variable "source_content" {
  description = "The content of the index.html file"
}

variable "index_document" {
  description = "The name of the index document"
}