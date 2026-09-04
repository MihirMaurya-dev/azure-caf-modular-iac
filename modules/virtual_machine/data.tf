data "azurerm_subnet" "subnet" {
  for_each = var.vms
  name = each.value.nic-subnet-name
  resource_group_name = each.value.rg-name
  virtual_network_name = each.value.vnet-name
}
