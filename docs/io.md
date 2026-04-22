## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_enabled | Enable or disable admin access to the ACR. | `bool` | `false` | no |
| azure\_services\_bypass | Allow trusted Azure services to access a network-restricted ACR. Possible values: None, AzureServices. | `string` | `"AzureServices"` | no |
| container\_registry\_config | Configuration for Azure Container Registry. | <pre>object({<br>    sku                       = optional(string)<br>    quarantine_policy_enabled = optional(bool)<br>    zone_redundancy_enabled   = optional(bool)<br>  })</pre> | <pre>{<br>  "quarantine_policy_enabled": true,<br>  "sku": "Premium",<br>  "zone_redundancy_enabled": true<br>}</pre> | no |
| container\_registry\_webhooks | Webhooks configuration for ACR. | <pre>map(object({<br>    service_uri    = string<br>    actions        = list(string)<br>    status         = optional(string)<br>    scope          = string<br>    custom_headers = map(string)<br>  }))</pre> | <pre>{<br>  "webhook": {<br>    "actions": [<br>      "push",<br>      "delete"<br>    ],<br>    "custom_headers": {<br>      "Authorization": "Bearer exampletoken",<br>      "X-Custom-Id": "webhook-123"<br>    },<br>    "scope": "core:*",<br>    "service_uri": "https://example.com/api/webhook",<br>    "status": "enabled"<br>  }<br>}</pre> | no |
| custom\_name | Override default naming convention | `string` | `null` | no |
| deployment\_mode | Specifies how the infrastructure/resource is deployed | `string` | `"terraform"` | no |
| enable\_content\_trust | Enable or disable content trust in ACR. | `bool` | `false` | no |
| enable\_data\_endpoint | Enable data endpoint for the container registry. | `bool` | `true` | no |
| enable\_diagnostic | Enable diagnostic settings for ACR. | `bool` | `true` | no |
| enable\_private\_endpoint | Enable private endpoint for ACR. | `bool` | `false` | no |
| enabled | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| encryption | Enable or disable encryption for ACR. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | n/a | yes |
| extra\_tags | Variable to pass extra tags. | `map(string)` | `null` | no |
| georeplications | List of Azure regions for ACR geo-replication. | <pre>list(object({<br>    location                = string<br>    zone_redundancy_enabled = optional(bool)<br>  }))</pre> | `[]` | no |
| identity\_ids | List of user managed identity IDs for ACR. | `list(string)` | `null` | no |
| key\_expiration\_date | The expiration date for the Key Vault key | `string` | `"2028-12-31T23:59:59Z"` | no |
| key\_permissions | List of key permissions for the Key Vault key. | `list(string)` | <pre>[<br>  "decrypt",<br>  "encrypt",<br>  "sign",<br>  "unwrapKey",<br>  "verify",<br>  "wrapKey"<br>]</pre> | no |
| key\_size | The size of the RSA key in bits. | `number` | `2048` | no |
| key\_type | The type of the key to create in Key Vault. | `string` | `"RSA-HSM"` | no |
| key\_vault\_id | Azure Key Vault ID for integration. | `string` | `null` | no |
| key\_vault\_rbac\_auth\_enabled | Enable RBAC authentication for Key Vault. | `bool` | `true` | no |
| label\_order | The order of labels used to construct resource names or tags. If not specified, defaults to ['name', 'environment', 'location']. | `list(any)` | <pre>[<br>  "name",<br>  "environment",<br>  "location"<br>]</pre> | no |
| location | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| log\_analytics\_workspace\_id | Log Analytics Workspace ID for diagnostics. | `string` | `null` | no |
| logs | List of log configurations for diagnostic settings. Each object can specify either category\_group or category. | <pre>list(object({<br>    category_group = optional(string)<br>    category       = optional(string)<br>  }))</pre> | `[]` | no |
| managedby | ManagedBy, eg 'terraform-az-modules'. | `string` | `"terraform-az-modules"` | no |
| manual\_connection | Indicates whether the connection is manual | `bool` | `false` | no |
| metric\_enabled | Boolean flag to specify whether Metrics should be enabled for the Container Registry. Defaults to true. | `bool` | `true` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | n/a | yes |
| network\_rule\_set | Network rules for ACR. | <pre>object({<br>    default_action = optional(string)<br>    ip_rule = optional(list(object({<br>      action   = optional(string)<br>      ip_range = string<br>    })))<br>    virtual_network = optional(list(object({<br>      subnet_id = string<br>    })))<br>  })</pre> | `null` | no |
| private\_dns\_zone\_ids | The ID of the private DNS zone. | `string` | `null` | no |
| public\_network\_access\_enabled | Allow or deny public network access to the ACR. | `bool` | `false` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/terraform-az-modules/terraform-azure-acr"` | no |
| resource\_group\_name | The name of the resource group in which to create the network security group. | `string` | n/a | yes |
| resource\_position\_prefix | Controls the placement of the resource type keyword (e.g., "vnet", "ddospp") in the resource name.<br><br>- If true, the keyword is prepended: "vnet-core-dev".<br>- If false, the keyword is appended: "core-dev-vnet".<br><br>This helps maintain naming consistency based on organizational preferences. | `bool` | `true` | no |
| retention\_policy\_in\_days | Retention period (in days) for untagged manifests in ACR. | `number` | `5` | no |
| rotation\_policy\_config | Rotation policy configuration for Key Vault keys. | <pre>object({<br>    enabled              = bool<br>    time_before_expiry   = optional(string, "P30D")<br>    expire_after         = optional(string, "P90D")<br>    notify_before_expiry = optional(string, "P29D")<br>  })</pre> | <pre>{<br>  "enabled": false,<br>  "expire_after": "P90D",<br>  "notify_before_expiry": "P29D",<br>  "time_before_expiry": "P30D"<br>}</pre> | no |
| scope\_map | Scope maps for ACR (Premium SKU only). | <pre>map(object({<br>    actions = list(string)<br>  }))</pre> | `null` | no |
| storage\_account\_id | Storage account ID for diagnostic settings destination. | `string` | `null` | no |
| subnet\_id | Subnet ID for the private endpoint. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| container\_registry\_admin\_password | The admin password of the newly created Container Registry, if admin access is enabled. |
| container\_registry\_admin\_username | The admin username of the newly created Container Registry, if admin access is enabled. |
| container\_registry\_id | The ID of the newly created Container Registry. |
| container\_registry\_identity\_principal\_id | The Principal ID of the Managed Service Identity assigned to the newly created Container Registry. |
| container\_registry\_identity\_tenant\_id | The Tenant ID of the Managed Service Identity assigned to the newly created Container Registry. |
| container\_registry\_login\_server | The login server URL of the newly created Container Registry. |
| container\_registry\_private\_endpoint | The ID of the newly created Azure Container Registry Private Endpoint, if enabled. |
| container\_registry\_scope\_map\_id | List of IDs for the newly created Container Registry scope maps (Premium SKU only). |
| container\_registry\_token\_id | List of IDs for the newly created Container Registry tokens (Premium SKU only). |
| container\_registry\_webhook\_id | List of IDs for the newly created Container Registry webhooks. |
| diagnostic\_setting\_id | The ID of the newly created Diagnostic Setting for the Container Registry. |
| key\_vault\_key\_id | The ID of the newly created Key Vault Key used for ACR encryption. |
| tags | A mapping of tags which should be assigned to the Container Registry. |
| user\_assigned\_identity\_id | The ID of the newly created User Assigned Identity for ACR encryption. |
| user\_assigned\_identity\_principal\_id | The Principal ID of the newly created User Assigned Identity for ACR encryption. |

