terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.110.0"
    }
  }
}

provider "azurerm" {
  features{
    resource_group {
         prevent_deletion_if_contains_resources = false
       }
  }
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
    
}

# resource "azurerm_resource_group" "aks" {
#   name     = "K8-Terraform-RG"
#   location = "East US"

#   tags = {
#     "ProvisionedBy" = "Sharjeel",
#     "Validity": "1d"
#   }
# }

module "resource-group" {
  source = "./modules/azure-rg"
  resource_group_name = var.resource_group
  location = var.location
  tags = {
    "ProvisionedBy" = "Sharjeel",
    "Validity": "1d"
  }
}



module "acr" {
  source = "./modules/acr"
  resource_group_name = var.resource_group
  location = var.location
  acr_name = "pythonapplicationnew01"
  depends_on = [module.resource-group]

  tags = {
    "ProvisionedBy" = "Sharjeel",
    "Validity" = "1d"
  }
}

module "aks-cluster" {
  source = "./modules/aks"
  cluster_name = "aks-cluster"
  resource_group_name = var.resource_group
  location = var.location
  node_pool_name = "application"
  dns_prefix = "aks"
  enable_node_public_ip = true
  depends_on = [module.resource-group]
  tags = {
    "ProvisionedBy" = "Ahsan Shaikh",
    "Validity" = "1d"
  }
}

resource "azurerm_virtual_network" "aks" {
  name                = "aks-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group
  

  tags = {
    "ProvisionedBy" = "Sharjeel",
    "Validity": "1d"
  }
  depends_on = [module.resource-group]
}

resource "azurerm_subnet" "aks" {
  name                 = "aks-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.aks.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [module.resource-group]
  
}

# module "virtual_machine" {
#   source = "./modules/vm"
#   resource_group_name = var.resource_group
#   resource_group_location = var.location
#   subnet_id = azurerm_subnet.aks.id

# }


resource "azurerm_network_security_group" "aks_nsg" {
  name                = "aks-nsg"
  location            = var.location
  resource_group_name = var.resource_group
  depends_on = [module.resource-group]

    tags = {
    "ProvisionedBy" = "Sharjeel",
    "Validity": "1d"
  }

  security_rule {
    name                       = "allow-31000-inbound"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "31000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "aks_nsg_assoc" {
  subnet_id                 = azurerm_subnet.aks.id
  network_security_group_id = azurerm_network_security_group.aks_nsg.id
  depends_on = [module.resource-group]
}