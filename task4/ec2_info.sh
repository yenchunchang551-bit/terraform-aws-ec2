#!/bin/bash

set -euo pipefail

INSTANCE_ID="${1:-}"

if [ -z "$INSTANCE_ID" ]; then
  echo "Usage: sh ./ec2_info.sh <instance-id>"
  exit 1
fi

# 檢查 aws cli 是否存在
if ! command -v aws >/dev/null 2>&1; then
  echo "Error: aws CLI is not installed."
  exit 1
fi

# 取得 EC2 資訊
EC2_INFO=$(aws ec2 describe-instances \
  --instance-ids "$INSTANCE_ID" \
  --query 'Reservations[0].Instances[0].[InstanceId,InstanceType,State.Name,LaunchTime,VpcId,SubnetId,PrivateIpAddress,PublicIpAddress]' \
  --output text 2>/dev/null || true)

if [ -z "$EC2_INFO" ] || [ "$EC2_INFO" = "None None None None None None None None" ]; then
  echo "Error: Instance not found or no permission to access."
  exit 1
fi

read -r INSTANCE_ID_OUT INSTANCE_TYPE STATE LAUNCH_TIME VPC_ID SUBNET_ID PRIVATE_IP PUBLIC_IP <<< "$EC2_INFO"

# AWS 有些 instance 沒有 Public IP，補成 N/A
PUBLIC_IP="${PUBLIC_IP:-N/A}"

echo "=== EC2 Information ==="
echo "Instance ID : $INSTANCE_ID_OUT"
echo "Instance Type : $INSTANCE_TYPE"
echo "State : $STATE"
echo "Launch Time : $LAUNCH_TIME"
echo "VPC ID : $VPC_ID"
echo "Subnet ID : $SUBNET_ID"
echo "Private IP : $PRIVATE_IP"
echo "Public IP : $PUBLIC_IP"