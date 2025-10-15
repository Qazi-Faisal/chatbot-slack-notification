output "chatbot_configuration_arn" {
  description = "ARN of the AWS Chatbot configuration"
  value       = aws_chatbot_slack_channel_configuration.devops.chat_configuration_arn
}

output "chatbot_role_arn" {
  description = "ARN of the IAM role used by AWS Chatbot"
  value       = aws_iam_role.chatbot_role.arn
}