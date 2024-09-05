# terraform-aws-kms

Magicorn made Terraform Module for AWS Provider
--
```
module "kms" {
  source      = "magicorntech/kms/aws"
  version     = "0.1.0"
  tenant      = var.tenant
  name        = var.name
  environment = var.environment

  ##### KMS Configuration #####
  # Enabled Services
  rds_encryption         = false
  elasticache_encryption = false
  dynamodb_encryption    = false
  s3_encryption          = false
  mq_encryption          = false
  efs_encryption         = false
  ec2_encryption         = true   # Encrypts EBS Volumes & Enables EC2 Key Pair Creation
  sqs_encryption         = false
  ecr_encryption         = false
  sns_encryption         = false
  es_encryption          = false
  msk_encryption         = false

  # Generic Key Configuration
  key_usage           = "ENCRYPT_DECRYPT"
  cmk_spec            = "SYMMETRIC_DEFAULT"
  deletion_window     = 7
  is_enabled          = true
  enable_key_rotation = true
  multi_region        = false

  # EC2 Key Pair Configuration
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII1VV6jyYWvQhDAabeuwumJGZYCAaJcLUEO624XFJCuz MrCskncn"
}
```