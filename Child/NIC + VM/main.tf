resource "azurerm_network_security_group" "NSG" {
  for_each = var.vms
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "NIC" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.SUBNET[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.PUBLICIP[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "NICNSG" {
  for_each = var.vms
  network_interface_id      = azurerm_network_interface.NIC[each.key].id
  network_security_group_id = azurerm_network_security_group.NSG[each.key].id
}

resource "azurerm_windows_virtual_machine" "VM" {
  for_each              = var.vms
  name                  = each.value.vm_name
  resource_group_name   = each.value.rg_name
  location              = each.value.location
  size                  = "Standard_B2s"
  admin_username        = each.value.admin_username
  admin_password        = each.value.admin_password
  network_interface_ids = [azurerm_network_interface.NIC[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
