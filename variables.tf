variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}


variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
  default     = "applicationpython02"
}

variable "acr_sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  default     = "Basic"
}

variable "resource_group" {
  description = "The name of the Azure Container Registry"
  type        = string
  default     = "K8-Terraform-RG"
}

variable "location" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  default     = "East US"
}


