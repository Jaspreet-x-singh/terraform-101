# terraform-101

# 🌱 Terraform Learning Repository

Welcome to my Terraform learning journey! This repository is a collection of examples, modules, and notes as I explore infrastructure as code using [Terraform](https://www.terraform.io/).

## 📁 Repository Structure

```
terraform-learning/
├── modules/           # Reusable Terraform modules
├── environments/      # Environment-specific configurations (dev, staging, prod)
├── examples/          # Standalone examples for practice
├── notes/             # Markdown notes and references
└── README.md          # Project overview and instructions
```

## 🚀 Getting Started

To run any example:

```bash
cd examples/<example-name>
terraform init
terraform plan
terraform apply
```

> ✅ Prerequisites:
> - [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
> - Cloud provider credentials (e.g., AWS, Azure, GCP)

## 📚 Topics Covered

- ✅ Terraform Basics: Providers, Resources, Variables
- 📦 Modules and Reusability
- 🗂️ State Management and Remote Backends
- 🔐 Secrets and Security Best Practices
- 🧪 Testing and Validation
- ☁️ Multi-cloud Deployments
- 🧰 CI/CD Integration

## 🛠 Tools Used

- Terraform CLI
- Visual Studio Code
- GitHub
- Azure

## 📖 Resources

- [Terraform Docs](https://developer.hashicorp.com/terraform/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [Awesome Terraform](https://github.com/shuaibiyy/awesome-terraform)

## ✅ To-Do

- [ ] Add examples for Azure
- [ ] Integrate with GitHub Actions
- [ ] Add diagrams using `terraform graph`

# Terraform Azure Infrastructure

This repository provisions core Azure infrastructure using **Terraform**.  
It uses a modular design to keep resources reusable and maintainable.

---

## 📦 Backend Configuration

Terraform state is stored remotely in Azure Storage for consistency and collaboration.  
The backend configuration is defined in `main.tf`:


terraform {
  backend "azurerm" {
    resource_group_name  = "<RESOURCE_GROUP_FOR_BACKEND>"
    storage_account_name = "<STORAGE_ACCOUNT_NAME>"
    container_name       = "<CONTAINER_NAME>"
    key                  = "<STATE_FILE_KEY>"
  }
}

Replace the placeholders with your own values when deploying.

## 🏗️ Modules

Resource Group
Creates the base resource group for all resources.

module "RG" {
  source              = "./modules/resource-group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

Virtual Network
Defines a VNet with multiple subnets.

module "vnet" {
  source              = "./modules/virtual-network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnets             = var.subnets
  tags                = var.tags
}

Storage Account

Creates a storage account for application/data needs.

module "storage" {
  source                   = "./modules/storage-account"
  storage_account_name     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

App Service Plan
Defines an App Service Plan for hosting web apps.

module "appserviceplan" {
  source                = "./modules/app-service-plan"
  app_service_plan_name = var.app_service_plan_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  app_service_plan      = var.app_service_plan
}


## ⚙️ Variables

All values are passed in via `variables.tf` or `terraform.tfvars`.  
Here are the key variables you’ll need to define:

| Variable                  | Description                          |
|---------------------------|--------------------------------------|
| `resource_group_name`     | Name of the resource group           |
| `location`                | Azure region                         |
| `vnet_name`               | Virtual network name                 |
| `address_space`           | VNet address space (list)            |
| `subnets`                 | List of subnet objects (name + CIDR) |
| `tags`                    | Map of tags for resources            |
| `storage_account_name`    | Storage account name                 |
| `account_tier`            | Storage account tier                 |
| `account_replication_type`| Replication type                     |
| `app_service_plan_name`   | App Service Plan name                |
| `app_service_plan`        | Object with tier/size                |


## 🚀 Usage

Initialize Terraform

bash
terraform init
Validate configuration

bash
terraform validate
Plan deployment

bash
terraform plan
Apply changes

bash
terraform apply

📂 Project Structure

.
├── main.tf                  # Root configuration
├── variables.tf             # Input variables
├── terraform.tfvars         # User-defined values (excluded from repo if sensitive)
├── modules/
│   ├── resource-group/
│   ├── virtual-network/
│   ├── storage-account/
│   └── app-service-plan/
└── README.md


## 📝 Notes

Do not commit sensitive values (like storage account keys) to the repo.

Use terraform.tfvars or environment variables to provide actual values.

Modules are reusable and can be extended (e.g., add App Services, Databases, Key Vaults).
