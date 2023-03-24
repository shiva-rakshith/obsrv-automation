resource "azurerm_resource_group" "rg" {
  name     = "${local.environment_name}"
  location = var.location
  tags = merge(
      local.common_tags,
      var.additional_tags
      )
}