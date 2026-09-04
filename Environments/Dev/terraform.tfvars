rgs1 = {
  rg1 = {
    name     = "rg-dev"
    location = "westus"
    tags = {
      env        = "dev"
      cost       = "IT"
      managed_by = "terraform"
    }
  }
}
pips = {
  pip = {
    name              = "bastion-pip"
    location          = "westus"
    rg-name           = "rg-dev"
    allocation-method = "Static"
  }
  pip1 = {
    name              = "nat-pip"
    location          = "westus"
    rg-name           = "rg-dev"
    allocation-method = "Static"
  }
  pip2 = {
    name              = "app-gw-pip"
    location          = "westus"
    rg-name           = "rg-dev"
    allocation-method = "Static"
  }
}
vnets = {
  vnet1 = {
    name          = "vnet-dev"
    location      = "westus"
    rg-name       = "rg-dev"
    address-space = ["10.0.0.0/16"]
    tags = {
      env        = "dev"
      cost       = "IT"
      managed_by = "terraform"
    }
  }
}
subnets = {
  sub1 = {
    name             = "frontend-subnet"
    location         = "westus"
    rg-name          = "rg-dev"
    vnet-name        = "vnet-dev"
    address-prefixes = ["10.0.1.0/24"]
  }
  sub2 = {
    name             = "backend-subnet"
    location         = "westus"
    rg-name          = "rg-dev"
    vnet-name        = "vnet-dev"
    address-prefixes = ["10.0.2.0/24"]
  }
  sub3 = {
    name             = "application-gateway-subnet"
    location         = "westus"
    rg-name          = "rg-dev"
    vnet-name        = "vnet-dev"
    address-prefixes = ["10.0.3.0/24"]
  }
  sub4 = {
    name             = "AzureBastionSubnet"
    location         = "westus"
    rg-name          = "rg-dev"
    vnet-name        = "vnet-dev"
    address-prefixes = ["10.0.4.0/26"]
  }
}
vms = {
  vm1 = {
    nic-name        = "frontend-vm-nic"
    location        = "westus"
    rg-name         = "rg-dev"
    ip-config-name  = "frontend-ip-config"
    nic-subnet-name = "frontend-subnet"
    vnet-name       = "vnet-dev"
    vm-name         = "frontend-vm"
    vm-size         = "Standard_D2s_v3"
    username        = "shahil"
    password        = "@ms6291431303"
    dp-auth         = false
    caching         = "ReadWrite"
    st-type         = "Standard_LRS"
    publisher       = "Canonical"
    offer           = "0001-com-ubuntu-server-jammy"
    sku             = "22_04-lts"
    version         = "latest"
  }
  vm2 = {
    nic-name        = "backend-vm-nic"
    location        = "westus"
    rg-name         = "rg-dev"
    ip-config-name  = "backend-ip-config"
    nic-subnet-name = "backend-subnet"
    vnet-name       = "vnet-dev"
    vm-name         = "backend-vm"
    vm-size         = "Standard_D2s_v3"
    username        = "shahil"
    password        = "@ms6291431303"
    dp-auth         = false
    caching         = "ReadWrite"
    st-type         = "Standard_LRS"
    publisher       = "Canonical"
    offer           = "0001-com-ubuntu-server-jammy"
    sku             = "22_04-lts"
    version         = "latest"
  }
}
bastion = {
  bastion = {
    name                = "dev-bastion"
    location            = "westus"
    rg-name             = "rg-dev"
    ip-config-name      = "bastion-ip-config"
    bastion-subnet-name = "AzureBastionSubnet"
    bastion-pip-name    = "bastion-pip"
    vnet-name           = "vnet-dev"
  }
}
nat = {
  nat = {
    name            = "dev-nat"
    location        = "westus"
    rg-name         = "rg-dev"
    vnet-name       = "vnet-dev"
    nat-pip-name    = "nat-pip"
    nat-subnet-name = "backend-subnet"
  }
}
