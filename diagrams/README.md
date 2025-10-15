# Architecture Diagrams

This directory contains architecture diagrams for the CloudWatch Auto Scaling Spot Instance Alert system.

## Files

- Upload your draw.io architecture diagram here
- Recommended naming: `cloudwatch-sns-chatbot-architecture.drawio` or `.png`

## Architecture Overview

The diagram should show:
- ASG → CloudWatch Event Rule → SNS Topic → AWS Chatbot → Slack
- IAM roles providing permissions to SNS and Chatbot services