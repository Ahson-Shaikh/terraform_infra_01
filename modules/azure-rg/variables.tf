variable "resource_group_name" {
  description = "The resource group name for ACR"
  type        = string
}


variable "location" {
  description = "The location for ACR"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {
      "ProvisionedBy" = "AhsanShaikh",
      "Validity": "1d"
  }
}
