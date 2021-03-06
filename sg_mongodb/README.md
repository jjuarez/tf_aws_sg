sg_mongodb terraform module
===========================

A terraform module with contains rules for a mongodb, which
you can use with your service Terraform template.

Ports
-----
- TCP 27017 (mongodb)
- TCP 27018 (mongodb shard installation)

Input Variables
---------------

- `security_group_name` - The name for your security group, e.g. `bluffdale_web_stage1`
- `vpc_id` - The VPC this security group should be created in.

Usage
-----

You can use these in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. `main.tf`

```
module "sg_mongodb" {
  source              = "github.com/terraform-community-modules/tf_aws_sg/sg_mongodb"
  security_group_name = "${var.security_group_name}-mongodb"
  vpc_id              = "${var.vpc_id}"
  source_cidr_block   = "${var.source_cidr_block}"
}
```

2. Setting values for the following variables, either through `terraform.tfvars` or `-var` arguments on the CLI

- security_group_name
- vpc_id
- source_cidr_block

