provider "aws" {
  region = "eu-west-1"
}

locals {
  environment             = "prod"
  project_name           = "autoscaling-alerts"
  autoscaling_group_name = "created-ASG"
  slack_channel_id       = "C1234567890"  # Replace with your #devops channel ID
  slack_team_id          = "T1234567890"  # Replace with your Slack workspace team ID
}

module "cloudwatch" {
  source        = "../../modules/cloudwatch"
  rule_name     = "${local.project_name}-spot-failure-${local.environment}"
  sns_topic_arn = module.sns.topic_arn
}

module "sns" {
  source     = "../../modules/sns"
  topic_name = "${local.project_name}-${local.environment}"
}

module "chatbot" {
  source             = "../../modules/chatbot"
  configuration_name = "${local.project_name}-${local.environment}"
  slack_channel_id   = local.slack_channel_id
  slack_team_id      = local.slack_team_id
  sns_topic_arn      = module.sns.topic_arn
}

resource "aws_autoscaling_notification" "asg_notifications" {
  group_names = [local.autoscaling_group_name]
  
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR"
  ]
  
  topic_arn = module.sns.topic_arn
}

