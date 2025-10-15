variable "configuration_name" {
  description = "Name for the AWS Chatbot configuration"
  type        = string
}

variable "slack_channel_id" {
  description = "Slack channel ID (e.g., C1234567890)"
  type        = string
}

variable "slack_team_id" {
  description = "Slack workspace team ID"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic to subscribe to"
  type        = string
}