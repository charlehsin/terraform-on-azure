resource "azuread_application" "example" {
  display_name     = var.display_name
  owners           = var.owners
  sign_in_audience = var.sign_in_audience
  logo_image       = (var.logo_image == "") ? null : var.logo_image

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "df021288-bdef-4463-88db-98f22de89214" # User.Read.All
      type = "Role"
    }

    resource_access {
      id   = "b4e74841-8e56-480b-be8b-910348b18b4c" # User.ReadWrite
      type = "Scope"
    }
  }

  # If this is a web app, provide web block.
  dynamic "web" {
    for_each = (var.web_required == false) ? toset([]) : toset([1])

    content {
      homepage_url  = var.web_homepage_url
      logout_url    = var.web_logout_url
      redirect_uris = var.web_redirect_uris

      implicit_grant {
        access_token_issuance_enabled = var.web_access_token_issuance_enabled
        id_token_issuance_enabled     = var.web_id_token_issuance_enabled
      }
    }
  }

  #If this is a single page application, provide single_page_application block
  dynamic "single_page_application" {
    for_each = (var.single_page_application_required == false) ? toset([]) : toset([1])

    content {
      redirect_uris = var.single_page_application_redirect_uris
    }
  }

  #If this is a mobile or desktop application, provide spublic_client block
  dynamic "public_client" {
    for_each = (var.public_client_required == false) ? toset([]) : toset([1])

    content {
      redirect_uris = var.public_client_redirect_uris
    }
  }
}

# Use this to get client secret
resource "azuread_application_password" "example" {
  application_object_id = azuread_application.example.object_id
  display_name          = var.client_secrete_display_name
  end_date_relative     = var.client_secrete_end_date_relative
}
