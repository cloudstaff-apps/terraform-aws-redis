# terraform-aws-rds

[![Lint Status](https://github.com/DNXLabs/terraform-aws-rds/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-rds/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-redis)](https://github.com/DNXLabs/terraform-aws-redis/blob/master/LICENSE)

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_cidrs | List of CIDRs to allow connection to this DB | `list(string)` | `[]` | no |
| allow\_security\_group\_ids | List of Security Group IDs to allow connection to this Redis | `list(string)` | `[]` | no |
| at\_rest\_encryption\_enabled | n/a | `bool` | `false` | no |
| auth\_token | n/a | `string` | `""` | no |
| automatic\_failover\_enabled | n/a | `bool` | `false` | no |
| create\_subnet\_group | Create a subnet group | `bool` | `false` | no |
| engine | n/a | `string` | n/a | yes |
| engine\_version | n/a | `string` | n/a | yes |
| environment\_name | Environment name to use as a prefix to this Redis | `string` | n/a | yes |
| kms\_key\_id | KMS Key ARN to use a CMK instead of default shared key | `string` | `""` | no |
| maintenance\_window | Specifies the weekly time range for when maintenance on the cache cluster is performed | `string` | `"sun:05:00-sun:07:00"` | no |
| multi\_az\_enabled | n/a | `bool` | `false` | no |
| name | Name of this Redis | `string` | n/a | yes |
| node\_type | The instance class to be used | `string` | n/a | yes |
| notification\_topic\_arn | n/a | `string` | `""` | no |
| number\_cache\_clusters | The number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2 | `number` | `1` | no |
| parameter\_group\_name | The name of the parameter group to associate with this replication group | `string` | `null` | no |
| port | Port number for this Redis | `number` | `6379` | no |
| snapshot\_retention\_limit | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them | `number` | `0` | no |
| snapshot\_window | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period | `string` | `"03:00-04:00"` | no |
| subnet\_group\_ids | List of Subnet IDs for the RDS Subnet Group | `list(any)` | `[]` | no |
| subnet\_group\_name | The name of the cache subnet group to be used for the replication group | `string` | n/a | yes |
| transit\_encryption\_enabled | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
| redis\_endpoint | n/a |
| redis\_sg | n/a |

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-template/blob/master/LICENSE) for full details.