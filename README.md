# terraform-aws-kms

Magicorn made Terraform Module for AWS Provider
--
```
module "kms" {
  source      = "magicorntech/kms/aws"
  version     = "0.0.1"
  tenant      = var.tenant
  name        = var.name
  environment = var.environment

  ##### KMS Configuration #####
  # Enabled Services
  rds_encryption         = true
  elasticache_encryption = true

  # Generic Key Configuration
  key_usage           = "ENCRYPT_DECRYPT"
  cmk_spec            = "SYMMETRIC_DEFAULT"
  deletion_window     = 7
  is_enabled          = true
  enable_key_rotation = true
  multi_region        = false
}
```