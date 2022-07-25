provider "azurerm" {
  features {}

  tenant_id = var.tenant_id
}

module "azurerm_api_management_api" {
  source = "../../modules/azure-api-management-api"

  resource_group_name                        = data.azurerm_resource_group.example.name
  azurerm_api_management_name                = data.azurerm_api_management.example.name
  azurerm_api_management_api_name            = var.azurerm_api_management_api_name
  azurerm_api_management_api_revision        = var.azurerm_api_management_api_revision
  azurerm_api_management_api_display_name    = var.azurerm_api_management_api_display_name
  azurerm_api_management_api_protocols       = var.azurerm_api_management_api_protocols
  azurerm_api_management_api_import_required = false
}

resource "azurerm_api_management_api_operation" "example" {
  operation_id        = var.azurerm_api_management_api_operation_id
  api_name            = module.azurerm_api_management_api.name
  api_management_name = data.azurerm_api_management.example.name
  resource_group_name = data.azurerm_resource_group.example.name
  display_name        = var.azurerm_api_management_api_operation_display_name
  method              = var.azurerm_api_management_api_operation_method
  url_template        = var.azurerm_api_management_api_operation_url_template
  description         = var.azurerm_api_management_api_operation_description

  response {
    status_code = var.azurerm_api_management_api_operation_response_status_code
    representation {
      content_type = "application/json"

      example {
        name = "default"
        value = jsonencode({
          sampleField = "test"
        })
      }
    }
  }
}

resource "azurerm_api_management_api_operation_policy" "example" {
  api_name            = azurerm_api_management_api_operation.example.api_name
  api_management_name = azurerm_api_management_api_operation.example.api_management_name
  resource_group_name = azurerm_api_management_api_operation.example.resource_group_name
  operation_id        = azurerm_api_management_api_operation.example.operation_id

  xml_content = <<XML
<policies>
  <inbound>
    <mock-response status-code="200" content-type="application/json" />
  </inbound>
</policies>
XML

}