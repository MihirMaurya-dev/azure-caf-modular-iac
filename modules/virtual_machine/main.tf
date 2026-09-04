resource "azurerm_network_interface" "nic" {
  for_each = var.vms
  name = each.value.nic-name
  location = each.value.location
  resource_group_name = each.value.rg-name
  ip_configuration {
    name = each.value.ip-config-name
    subnet_id = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "Lvm" {
  depends_on = [ azurerm_network_interface.nic ]
  for_each = var.vms
name = each.value.vm-name
resource_group_name = each.value.rg-name
location = each.value.location
size = each.value.vm-size
admin_username = each.value.username
admin_password = each.value.password
disable_password_authentication = each.value.dp-auth
network_interface_ids = [azurerm_network_interface.nic[each.key].id]
os_disk {
caching = each.value.caching
storage_account_type = each.value.st-type
}

source_image_reference {
publisher = each.value.publisher
offer = each.value.offer
sku = each.value.sku
version = each.value.version
}
}