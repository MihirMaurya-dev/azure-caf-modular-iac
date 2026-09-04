resource "azurerm_nat_gateway" "nat" {
    for_each = var.nat
  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.rg-name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10

}
resource "azurerm_nat_gateway_public_ip_association" "nat-pip-association" {
    for_each = var.nat
  nat_gateway_id       = azurerm_nat_gateway.nat[each.key].id 
  public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}
resource "azurerm_subnet_nat_gateway_association" "name" {
    for_each = var.nat
    subnet_id = data.azurerm_subnet.subnet[each.key].id
    nat_gateway_id = azurerm_nat_gateway.nat[each.key].id
    
  
}