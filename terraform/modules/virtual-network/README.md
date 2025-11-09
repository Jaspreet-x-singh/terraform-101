# Virtual Network module

This module creates an Azure Virtual Network (`azurerm_virtual_network`) and zero or more subnets (`azurerm_subnet`). It's intended to be used as a small reusable module inside the `terraform` root configuration.

## Usage

```hcl
module "vnet" {
  source              = "./modules/virtual-network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = "vnet-terraform-101"
  address_space       = ["10.1.0.0/16"]
  subnets = [
    { name = "subnet-app"    , address_prefix = "10.1.1.0/24" },
    { name = "subnet-db"     , address_prefix = "10.1.2.0/24" },
    { name = "subnet-public" , address_prefix = "10.1.3.0/24" },
  ]
  tags = {
    environment = "dev"
    owner       = "terraform"
  }
}
```

## Inputs

- `resource_group_name` (string) - Name of the resource group where the VNet will be created. Required.
- `location` (string) - Azure location for the VNet. Required.
- `vnet_name` (string) - Name of the virtual network. Required.
- `address_space` (list(string)) - List of CIDR blocks for the VNet address space. Default: `["10.0.0.0/16"]`.
- `subnets` (list(object)) - List of objects describing subnets to create. Each object must include:
  - `name` (string)
  - `address_prefix` (string)
  Default: `[]` (no subnets created).
- `tags` (map(string)) - Optional tags applied to the VNet. Default: `{}`.

## Outputs

- `vnet_id` - The resource ID of the created virtual network.
- `subnet_ids` - Map of subnet name -> subnet ID for subnets created by the module.

## Notes

- Subnets are created using a `for_each` keyed by the subnet `name`. Ensure subnet names are unique within the list.
- The module expects `subnets` items to be objects with `name` and `address_prefix` fields. Example shown above.
- If you prefer to pass these values from root variables, define root-level variables and pass them into the module instead of hard-coding values in the module call.

## Example: parameterizing at root

Add variables to `terraform/variables.tf` and then pass them into the module. This keeps environment-specific values configurable.

---

If you'd like, I can also:
- Add input validation (Terraform 0.13+ `validation` blocks) for subnet CIDR formatting.
- Add a small example `examples/` directory demonstrating multiple environments (dev/prod).
- Add a simple test harness (using `terratest` or `kitchen-terraform`) if you want CI-level validation.
