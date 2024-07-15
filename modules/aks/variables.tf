variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "max_pods" {
  description = "The number of pods in the node"
  type        = number
  default     = 10
}

variable "vm_size" {
  description = "The size of the virtual machines in the default node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "enable_node_public_ip" {
  description = "Enable Node Public IP"
  type        = bool
}

variable "node_pool_name" {
  description = "The size of the virtual machines in the default node pool"
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

