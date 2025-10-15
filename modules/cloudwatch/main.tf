resource "aws_cloudwatch_event_rule" "asg_spot_failure" {
  name        = var.rule_name
  description = "Capture ASG Spot instance interruption/failure events"

  event_pattern = jsonencode({
    source      = ["aws.autoscaling"]
    detail-type = [
      "EC2 Instance Launch Unsuccessful",
      "EC2 Spot Instance Interruption Warning"
    ]
    detail = {
      cause = [{
        prefix = "Spot"
      }]
    }
  })
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.asg_spot_failure.name
  target_id = "SendToSNS"
  arn       = var.sns_topic_arn
}