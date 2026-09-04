resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnet
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.rg-name
  address_space = each.value.address-space
  tags = lookup(each.value,"tags",{})
}