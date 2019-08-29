# terraform-aws-system-role

This Terraform 0.12 module is repsonsible for creating IAM roles, that can be assumed by specific accounts. It also allows

## Example

```terraform
module "ci_role" {
  source      = "https://github.com/formunauts/terraform-aws-system-role.git?ref=master"
  namespace   = "formunauts"
  stage       = "dev"
  name        = "drone"
  require_mfa = false
  account_id  = "1234567890"
}

```

## Inputs

| Name        | Description                                           | Type           | Default                                           | Required |
|-------------|-------------------------------------------------------|----------------|---------------------------------------------------|----------|
| account_id  | AWS account ID from where the role can be assumed     | `string`       | `<empty>`                                         | No       |
| enabled     | Wheter or not to create role                          | `bool`         | `true`                                            | No       |
| name        | Application or solution name (e.g. `app`)             | `string`       | `account`                                         | No       |
| namespace   | Namespace (e.g. `fn` or `formunauts`)                 | `string`       | -                                                 | Yes      |
| policy_arns | List of policy ARNs to be attached to the role        | `list(string)` | `["arn:aws:iam::aws:policy/AdministratorAccess"]` | No       |
| require_mfa | Whether or not to require multi-factor authentication | `bool`         | `true`                                            | No       |
| role_name   | Name of the role                                      | `string`       | `<empty>`                                         | No       |
| stage       | Stage (e.g. `prod`, `dev`, `staging`)                 | `string`       | -                                                 | Yes      |

## Outputs

| Name      | Description              |
|-----------|--------------------------|
| role_arn  | ARN of the created role  |
| role_name | Name of the created role |


## License

See [LICENSE](LICENSE) for full details.

```
Copyright (C) 2019 Formunauts GmbH

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
