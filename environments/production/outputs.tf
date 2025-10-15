output "sns_topic_arn" {
  value = module.sns.topic_arn
}

output "cloudwatch_rule_arn" {
  value = module.cloudwatch.rule_arn
}

output "sns_role_arn" {
  value = module.sns.sns_role_arn
}

output "chatbot_configuration_arn" {
  value = module.chatbot.chatbot_configuration_arn
}

output "chatbot_role_arn" {
  value = module.chatbot.chatbot_role_arn
}