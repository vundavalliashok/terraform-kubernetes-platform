resource "random_string" "suffix" {
  length  = 5
  upper   = false
  special = false
}

resource "azurerm_resource_group" "aks" {
  name     = "rg-${var.project_name}-${random_string.suffix.result}"
  location = var.location

  tags = {
    project     = var.project_name
    environment = "dev"
    managed_by  = "terraform"
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.project_name}-${random_string.suffix.result}"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "dns-${random_string.suffix.result}"

  sku_tier = "Free"

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  default_node_pool {
    name                 = "system"
    vm_size              = var.node_vm_size
    node_count           = var.node_count
    auto_scaling_enabled = false
    type                 = "VirtualMachineScaleSets"
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    load_balancer_sku   = "standard"
    service_cidr        = "10.10.0.0/16"
    dns_service_ip      = "10.10.0.10"
    pod_cidr            = "10.244.0.0/16"
  }

  tags = {
    project     = var.project_name
    environment = "dev"
    managed_by  = "terraform"
  }
}