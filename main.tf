provider "azurerm" {
    version = "2.40.0"
    features {}

}
terraform {
    backend "azurerm"{
        resource_group_name = "RG-Terraform-POC-BLOBStore"
        storage_account_name = "tfpocstorageaccountp"
        container_name = "tfstate"
        key = "terraform.tfstate"
    }
}

variable "imagebuild" {
  type        = string
  default     = ""
  description = "Lastest Image Build"
}

resource "azurerm_resource_group" "tf_test" {
    name = "RG-Terraform-POC"
    location = "eastus2"
}

resource "azurerm_container_group" "tfcg_test" {
    name = "weatherapi1"
    location = azurerm_resource_group.tf_test.location
    resource_group_name = azurerm_resource_group.tf_test.name

    ip_address_type = "public"
    dns_name_label = "TerraformPOCwa"
    os_type = "Linux"

    container {
        name = "weatherapi1"
        image = "irietech/weatherapi:${var.imagebuild}"
            cpu = "1"
            memory = "1"

            ports{
                port = 80
                protocol = "TCP"
            }
    }

}