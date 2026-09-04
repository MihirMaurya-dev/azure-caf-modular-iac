data "azurerm_public_ip" "pip" {
  for_each = var.bastion
  name = each.value.bastion-pip-name
  resource_group_name = each.value.rg-name

}
data "azurerm_subnet" "subnet" {
  for_each = var.bastion
  name = each.value.bastion-subnet-name
  resource_group_name = each.value.rg-name
  virtual_network_name = each.value.vnet-name
}
