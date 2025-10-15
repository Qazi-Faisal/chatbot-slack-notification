output "topic_arn" {
  value = aws_sns_topic.this.arn
}

output "sns_role_arn" {
  description = "ARN of the SNS IAM role"
  value       = aws_iam_role.sns_role.arn
}