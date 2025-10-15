resource "aws_sns_topic" "this" {
  name              = var.topic_name
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_sns_topic_policy" "this" {
  arn = aws_sns_topic.this.arn

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
        Action   = "sns:Publish"
        Resource = aws_sns_topic.this.arn
      },
      {
        Effect = "Allow"
        Principal = {
          Service = "autoscaling.amazonaws.com"
        }
        Action   = "sns:Publish"
        Resource = aws_sns_topic.this.arn
      }
    ]
  })
}



resource "aws_iam_role" "sns_role" {
  name = "${var.topic_name}-sns-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "sns.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "sns_policy" {
  name = "${var.topic_name}-sns-policy"
  role = aws_iam_role.sns_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "sns:Publish",
        "sns:Subscribe"
      ]
      Resource = aws_sns_topic.this.arn
    }]
  })
}