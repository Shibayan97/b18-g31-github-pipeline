module "resource_group" {
  source = "../../Child/RG"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../Child/Vnet"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../Child/Subnet"
  subnets    = var.subnets
}

module "public_ip_address" {
  depends_on = [module.resource_group]
  source     = "../../Child/PublicIP"
  pips       = var.pips
}

module "virtual_machine" {
  depends_on = [module.public_ip_address, module.subnet]
  source     = "../../Child/NIC + VM"
  vms        = var.vms
}