variable "resource_group_name" {
  description = "value"
  type = string
}

variable "resource_group_location" {
  description = "value"
  type = string
}


variable "subnet_id" {
  description = "value"
  type = string
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {
      "ProvisionedBy" = "AhsanShaikh",
      "Validity": "1d"
  }
}


