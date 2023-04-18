data "azurerm_subnet" "sn" {
  name                 = "subnet001"
  virtual_network_name = "sandbox-vnet"
  resource_group_name  = "sandbox-shared-services-rg"
}


resource "azurerm_resource_group" "rg" {
  name     = "valheim-rg"
  location = "eastus"
}

resource "azurerm_network_interface" "nic" {
  name = "linux-docker-nic"

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.sn.id
    private_ip_address_allocation = "Dynamic"
  }
}



resource "azurerm_linux_virtual_machine" "linux" {
  name                = "docker-linux"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_B2s"
  admin_username      = "jccourtn"
  admin_password      = "Testingbastion123"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  custom_data = filebase64("docker/install_docker.sh")
}