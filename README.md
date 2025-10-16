# CloudWatch Auto Scaling Spot Instance Alert

Terraform infrastructure for monitoring Auto Scaling Group spot instance failures using CloudWatch Events and AWS Chatbot.
 
# Architecture Diagram :
<img width="2731" height="1248" alt="image" src="https://github.com/user-attachments/assets/17623629-e8dd-41f0-8d77-6e848e35f860" />

## Project Structure

```
chatbot-slack-notification/
├── version.tf                # Version management
├── diagrams/                 # Architecture diagrams
├── modules/                  # Reusable Terraform modules
│   ├── cloudwatch/           # CloudWatch Event rules and targets
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── sns/                  # SNS topic and IAM policies
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── chatbot/              # AWS Chatbot Slack integration
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/             # Environment-specific configurations
│   └── production/          # Production environment
│       ├── main.tf          # Main configuration
│       ├── variables.tf     # Environment variables
│       ├── backend.tf       # S3 state storage
│       └── outputs.tf       # Outputs
└── README.md                # This file
```

## Prerequisites

### 1. AWS Chatbot - Slack Integration (Manual Setup):
1. Go to **AWS Chatbot Console** → **Configure new client**
2. Select **Slack** → **Configure**
3. **Authorize AWS Chatbot** in your Slack workspace
4. Note down your **Slack Team ID** and **Channel ID**

### 2. Configuration

Update `environments/production/main.tf` with your Slack details:

```hcl
locals {
  slack_channel_id       = "C1234567890"  # ← Your #devops channel ID
  slack_team_id          = "T1234567890"  # ← Your Slack workspace team ID
  autoscaling_group_name = "your-asg-name"  # ← UPDATE ASG NAME
}
```

## Deployment

```bash
cd environments/production
terraform init
terraform plan
terraform apply
```

## Architecture

**CloudWatch → SNS → AWS Chatbot → Slack Flow:**
```
ASG Spot Instance Failure/Interruption
            ↓
CloudWatch Event Rule (captures failure)
            ↓
        SNS Topic (fan-out)
        [SNS IAM Role]
            ↓
       AWS Chatbot
       [Chatbot IAM Role]
            ↓
    Slack #devops Channel
```

**Components:**
- **CloudWatch Event Rule** captures ASG spot instance failures
- **SNS Topic** receives and distributes notifications
- **AWS Chatbot** integrates with Slack workspace
- **IAM Roles** provide necessary permissions

## Features

- **Enterprise Integration**: AWS Chatbot for secure Slack messaging
- **CloudWatch Events**: Captures spot instance interruptions
- **No Custom Code**: No Lambda or webhooks required
- **IAM Security**: Dedicated roles for each service
- **Modular Design**: Reusable Terraform modules
- **Complete Outputs**: All resource ARNs available
