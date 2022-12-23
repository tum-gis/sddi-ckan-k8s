# General ---------------------------------------------------------------------

variable "location" {
  type        = string
  default     = "West Europe"
  description = "Location where the infrastructure shall be deployed."
}

variable "resource_group_name" {
  type        = string
  default     = "rg-sta-k8s"
  description = "Name of the resource group in which all services shall be started."
}

# k8s -------------------------------------------------------------------------
variable "k8s_default_node_count" {
  type        = number
  default     = 1
  description = "Size of the default node pool."
}

# Check this on available nodes
# Types: https://docs.microsoft.com/de-de/azure/virtual-machines/sizes-general
# Cost: https://azure.microsoft.com/en-in/pricing/details/virtual-machines/linux/#pricing

variable "k8s_default_node_type" {
  type        = string
  default     = "Standard_B1s"
  description = "VM type of the default pool."
}

variable "k8s_database_node_count" {
  type        = number
  default     = 1
  description = "Size of the database node pool."
}

variable "k8s_database_node_type" {
  type        = string
  default     = "Standard_D4s_v3"
  description = "VM type of the database pool."
}

variable "use_azure_ingress_controller" {
  default     = false
  type        = bool
  description = "Use Azure build in ingress controller"
}

# Cost control and budgets ----------------------------------------------------
variable "contact_emails" {
  type    = list(string)
  default = ["user@example.de"]
}
