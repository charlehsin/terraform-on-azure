provider "azurerm" {
  features {}

  tenant_id = "46c98d88-e344-4ed4-8496-4ed7712e255d"
}

resource "azurerm_public_ip" "public_ip" {
  name                = "terraform-lb-ip"
  resource_group_name = "MyMainEMAGroup"
  location            = "westus2"
  allocation_method   = "Static"
  sku                 = "Standard"
  sku_tier            = "Regional"
  domain_name_label   = "lbcfterraformtest"
}

resource "azurerm_lb" "lb" {
  name                = "terraform-lb"
  location            = "westus2"
  resource_group_name = "MyMainEMAGroup"
  sku                 = "Standard"
  sku_tier            = "Regional"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}
