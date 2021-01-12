<<<<<<< HEAD
provider "azurerm" {
    version = "2.40.0"
    features {}

}
terraform {
    backend "azurerm"{
        resource_group_name = "RG-Terraform-POC-BLOBStore"
        storage_account_name = "tfpocstorageaccount"
        container_name = "tfstate"
        key = "terraform.tfstate"
    }
}

resource "azurerm_resource_group" "tf_test" {
    name = "RG-Terraform-POC"
    location = "eastus2"
}

resource "azurerm_container_group" "tfcg_test" {
    name = "weatherapi"
    location = azurerm_resource_group.tf_test.location
    resource_group_name = azurerm_resource_group.tf_test.name

    ip_address_type = "public"
    dns_name_label = "TerraformPOCwa"
    os_type = "Linux"

    container {
        name = "weatherapi"
        image = "irietech/weatherapi"
            cpu = "1"
            memory = "1"

            ports{
                port = 80
                protocol = "TCP"
            }
    }

=======
provider "azurerm" {
    version = "2.40.0"
    features {}

}

resource "azurerm_resource_group" "tf_test" {
    name = "RG-Terraform-POC"
    location = "eastus2"
}

resource "azurerm_container_group" "tfcg_test" {
    name = "weatherapi"
    location = azurerm_resource_group.tf_test.location
    resource_group_name = azurerm_resource_group.tf_test.name

    ip_address_type = "public"
    dns_name_label = "TerraformPOCwa"
    os_type = "Linux"

    container {
        name = "weatherapi"
        image = "irietech/weatherapi"
            cpu = "1"
            memory = "1"

            ports{
                port = 80
                protocol = "TCP"
            }
    }

>>>>>>> 80fc2615f9ca73b37b7b294e32309baf2e254ac0
}