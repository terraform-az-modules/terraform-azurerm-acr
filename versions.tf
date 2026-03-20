##-----------------------------------------------------------------------------
## Versions
##-----------------------------------------------------------------------------
# Terraform version
terraform {
  required_version = ">= 1.14.5"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.31.0"
    }
  }

  provider_meta "azurerm" {
    module_name = "terraform-az-modules/terraform-azurerm-acr"
  }
}
