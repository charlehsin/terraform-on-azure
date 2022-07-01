provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

resource "azurerm_api_management_api" "example" {
  name                = var.azurerm_api_management_api_name
  resource_group_name = data.azurerm_resource_group.example.name
  api_management_name = data.azurerm_api_management.example.name
  revision            = var.azurerm_api_management_api_revision
  display_name        = var.azurerm_api_management_api_display_name
  path                = var.azurerm_api_management_api_path
  protocols           = var.azurerm_api_management_api_protocols
  service_url         = var.azurerm_api_management_api_service_url

  import {
    content_format = var.azurerm_api_management_api_import_content_format
    content_value  = var.azurerm_api_management_api_import_content_value
  }
}

resource "azurerm_api_management_api_policy" "example" {
  api_name            = azurerm_api_management_api.example.name
  api_management_name = azurerm_api_management_api.example.api_management_name
  resource_group_name = azurerm_api_management_api.example.resource_group_name

  xml_content = <<XML
<policies>
   <inbound>
     <rate-limit-by-key calls="3" renewal-period="15" counter-key="@(context.Subscription.Id)" />
     <base />
   </inbound>
   <backend>
     <base />
   </backend>
   <outbound>
     <set-header name="X-Powered-By" exists-action="delete" />
     <set-header name="X-AspNet-Version" exists-action="delete" />
     <redirect-content-urls />
     <base />
   </outbound>
   <on-error>
     <base />
   </on-error>
</policies>
XML
}
