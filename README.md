# terraform-aws-kms

Magicorn made Terraform Module for AWS Provider
--
```
module "kms" {
  source      = "magicorntech/kms/aws"
  version     = "0.2.0"
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
  default_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE4AAAAIP4pI3O1wgYOS82gztfjcQ3ZdNCuDyFP70iCQnI8tYAq nops@magicorn.co"
  windows_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQClpV0bhTljTfnCIfMDhj+MvGJM96SqL2raSmNMLJ8dS8k0I61LWn4rKHU+Tci8DbIo4sIMODkgrwj1U9VVnTb+mS9h6G57dRb/IsUrsLUm0nKhrQctf2TalC2c4Xa+U6J7XCu6U2g3Qv8EWtLT2qTpEcZGXKuW6a1qxxFkwNpPD5tIALqMpeS1o0z9n4KLa5E5ogJzV+NIse/H5S82t9Fa9oNNQVoizKrgAtKz8sycv6YlNCChuRjPxDvrIesZqSXzwBlO+DOvaH+e1mHd5qiJDrJ5Fl3RVzGbFqMUIoRmGbcju765AUNwAacGjvMtzQRLhGqvQ879o8vRULfRnOOZTrUkG0Y918QJDnZYDLGqPIqFjxk21Boz5v+RMHypyPkW/8PUYUndGKf/H0hZWDuHKSCzhxNRf9lh6pWMSdakHD0BdhZCF7MErYuxHae3kPc2nFuGAiYiUmI3DKaUCIQsOnahF5AiOD1fPjm6zKO8vqkvJ4MkFY84Ap7pDp+Tsg6fO4VD3oX0+niNEKpvol+1K/+GT016cpv/g4NX2wwVosOxfq89D3rDrS8g1pn2GKtWeVou9iRWJLXMlOoZv7stuTz25vLEdKrtcbCTtugfCUiPng9m2JuiX3I9lbFBPvZTcv0TO46gwzFa3tIm1clI3yI18ea5n4LdY8YEUG8kIw== nops@magicorn.co"
}
```