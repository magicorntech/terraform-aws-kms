output "rds_key_id" {
	value = aws_kms_key.rds[*].arn
}

output "elasticache_key_id" {
	value = aws_kms_key.elasticache[*].arn
}

output "dynamodb_key_id" {
	value = aws_kms_key.dynamodb[*].arn
}

output "s3_key_id" {
	value = aws_kms_key.s3[*].arn
}

output "mq_key_id" {
	value = aws_kms_key.mq[*].arn
}

output "efs_key_id" {
	value = aws_kms_key.efs[*].arn
}

output "ec2_key_id" {
	value = aws_kms_key.ec2[*].arn
}

output "ec2_key_pair_name" {
	value = aws_key_pair.ec2[*].key_name
}

output "ec2_win_key_pair_name" {
	value = aws_key_pair.ec2_win[*].key_name
}

output "sqs_key_id" {
	value = aws_kms_key.sqs[*].arn
}

output "ecr_key_id" {
	value = aws_kms_key.ecr[*].arn
}

output "sns_key_id" {
	value = aws_kms_key.sns[*].arn
}

output "es_key_id" {
	value = aws_kms_key.es[*].arn
}

output "msk_key_id" {
	value = aws_kms_key.msk[*].arn
}