resource "aws_chatbot_slack_channel_configuration" "devops" {
  configuration_name = var.configuration_name
  iam_role_arn      = aws_iam_role.chatbot_role.arn
  slack_channel_id  = var.slack_channel_id
  slack_team_id     = var.slack_team_id
  
  sns_topic_arns = [var.sns_topic_arn]
}

resource "aws_iam_role" "chatbot_role" {
  name = "${var.configuration_name}-chatbot-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "chatbot.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "chatbot_policy" {
  role       = aws_iam_role.chatbot_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}