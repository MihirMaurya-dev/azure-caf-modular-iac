module "resource_group" {
  source = "../../modules/resource_group"
  rgs    = var.rgs1
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/virtual_network"
  vnet       = var.vnets
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/subnet"
  subnets    = var.subnets
}
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/public_ip"
  pips       = var.pips
}
module "bastion" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../modules/bastion"
  bastion    = var.bastion
}
module "virtual_machine" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../modules/virtual_machine"
  vms        = var.vms
}
module "nat_gateway" {
  depends_on = [module.public_ip, module.subnet]
  source     = "../../modules/NAT gateway"
  nat        = var.nat
}
