variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "acr_sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  default     = "Basic"
}

variable "resource_group_name" {
  description = "The resource group name for ACR"
  type        = string
}


variable "location" {
  description = "The location for ACR"
  type        = string
}


variable "admin_enabled" {
  description = "The location for ACR"
  type        = bool
  default = true
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {
      "ProvisionedBy" = "AhsanShaikh",
      "Validity": "1d"
  }
}
