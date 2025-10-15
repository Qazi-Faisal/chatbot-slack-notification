output "rule_arn" {
  description = "ARN of the CloudWatch Event rule"
  value       = aws_cloudwatch_event_rule.asg_spot_failure.arn
}