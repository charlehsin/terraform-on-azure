# Azure virtual machine

This module provisions Azure virtual machine running a custom Azure image. This will do the following

1. Enable WinRM via HTTP.
2. Upload the target source content to the target destination on the virtual machine.
3. Run target commands on the virtual machine.

## References

- [azurerm_windows_virtual_machine \ source_image_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine#source_image_id)
- [Data Source: azurerm_image](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/image)
