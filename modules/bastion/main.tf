# NEEDS TO BE REFACTORED FOR MODULE
resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/27"]
}

resource "azurerm_public_ip" "bastion_pip" {
  name                = "bastion-pip"
  location            = data.azurerm_virtual_network.vnet.location
  resource_group_name = data.azurerm_virtual_network.vnet.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_bastion_host" "bastion" {
  name                = "sandbox-bastion"
  resource_group_name = data.azurerm_virtual_network.vnet.resource_group_name
  location            = data.azurerm_virtual_network.vnet.location

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.bastion_pip.id
  }

  depends_on = [
    azurerm_public_ip.bastion_pip,
    azurerm_subnet.bastion
  ]
}