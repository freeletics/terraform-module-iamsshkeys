# terraform-module-iamsshkeys

A terraform module to provide a iam role in AWS to allow retrieving iam user and their keys regarding their groups.

Module Input Variables
----------------------

- `profile_prefix` - variable naming prefix for the instance profile (default: pull_sshkeys)
- `role_prefix` - variable naming prefix for the role (default: pull_sshkeys)

Usage
-----

```hcl
module "pull_sshkeys" {
  source = "github.com/freeletics-engineering/terraform-module-iamsshkeys"
}
```


Outputs
=======

 - `policy`            - The json generated as the actual policy
 - `role`              - rolename that has been generated
 - `instance_profile`  - instance_profile that has been generated


Authors
=======

operations@freeletics.com