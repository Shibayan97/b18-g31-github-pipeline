rgs = {
  rg1 = {
    rg_name  = "rg-dushyant"
    location = "centralindia"
  }

  rg2 = {
    rg_name  = "rg-dolly"
    location = "eastus"
  }
}

vnets = {
  vnet1 = {
    vnet_name     = "vnet-Jio"
    location      = "centralindia"
    rg_name       = "rg-dushyant"
    address_space = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    subnet_name      = "frontend-subnet"
    rg_name          = "rg-dushyant"
    vnet_name        = "vnet-Jio"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet2 = {
    subnet_name      = "backend-subnet"
    rg_name          = "rg-dushyant"
    vnet_name        = "vnet-Jio"
    address_prefixes = ["10.0.2.0/24"]
  }

}

pips = {
  pip1 = {
    pip_name          = "frontend-pip"
    rg_name           = "rg-dushyant"
    location          = "centralindia"
    allocation_method = "Static"
  }

  pip2 = {
    pip_name          = "backend-pip"
    rg_name           = "rg-dushyant"
    location          = "centralindia"
    allocation_method = "Static"
  }
}

vms = {
  vm1 = {
    nic_name       = "nic-frontend-vm"
    location       = "centralindia"
    rg_name        = "rg-dushyant"
    subnet_name    = "frontend-subnet"
    vnet_name      = "vnet-Jio"
    pip_name       = "frontend-pip"
    vm_name        = "frontend-vm"
    admin_username = "Shibayan97"
    admin_password = "Boco6@~483"
    nsg_name       = "nsg-frontend-vm"
  }

  vm2 = {
    nic_name       = "nic-backend-vm"
    location       = "centralindia"
    rg_name        = "rg-dushyant"
    subnet_name    = "backend-subnet"
    vnet_name      = "vnet-Jio"
    pip_name       = "backend-pip"
    vm_name        = "backend-vm"
    admin_username = "DevopsAdmin"
    admin_password = "DevOps@1234"
    nsg_name       = "nsg-backend-vm"
  }
}



