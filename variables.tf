variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "centralindia"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "sreplatform"
}

variable "node_vm_size" {
  description = "Azure VM size for the AKS node"
  type        = string
  default     = "Standard_D2s_v5"
}

variable "node_count" {
  description = "Initial number of Kubernetes nodes"
  type        = number
  default     = 1

  validation {
    condition     = var.node_count >= 1 && var.node_count <= 3
    error_message = "For this learning project, node_count must be between 1 and 3."
  }
}