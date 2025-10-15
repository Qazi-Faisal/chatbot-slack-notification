variable "slack_webhook_url" {
  description = "Slack webhook URL for notifications"
  type        = string
  default     = ""
}

variable "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group to monitor"
  type        = string
  default     = "created-ASG"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}