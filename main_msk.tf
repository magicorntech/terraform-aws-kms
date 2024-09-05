resource "aws_kms_key" "msk" {
  count                   = (var.msk_encryption == true) ? 1 : 0
  description             = "${var.tenant}-${var.name}-msk-kms-${var.environment}"
  key_usage                = var.key_usage
  customer_master_key_spec = var.cmk_spec
  deletion_window_in_days  = var.deletion_window
  is_enabled               = var.is_enabled
  enable_key_rotation      = var.enable_key_rotation
  multi_region             = var.multi_region

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "auto-kafka-1",
    "Statement": [
        {
            "Sid": "Allow access through Kafka for all principals in the account that are authorized to use MSK",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:CreateGrant",
                "kms:ListGrants",
                "kms:DescribeKey"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "kms:ViaService": "kafka.${data.aws_region.current.name}.amazonaws.com",
                    "kms:CallerAccount": "${data.aws_caller_identity.current.account_id}"
                }
            }
        },
        {
            "Sid": "Allow direct access to key metadata to the account",
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                  "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
                  "${data.aws_caller_identity.current.arn}"
                ]
            },
            "Action": [
                "kms:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF

  tags = {
    Name        = "${var.tenant}-${var.name}-msk-kms-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}

resource "aws_kms_alias" "msk" {
  count         = (var.msk_encryption == true) ? 1 : 0
  name          = "alias/${var.tenant}/${var.name}/msk/${var.environment}"
  target_key_id = aws_kms_key.msk[0].key_id
}