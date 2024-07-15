

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size

    tags = var.tags
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
  depends_on = [ var.resource_group_name ]
}

resource "azurerm_kubernetes_cluster_node_pool" "backend" {
  name                  = var.node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.vm_size
  node_count            = var.node_count
  max_pods              = var.max_pods
  enable_node_public_ip = var.enable_node_public_ip

  tags = var.tags
  depends_on = [ var.resource_group_name ]
}


