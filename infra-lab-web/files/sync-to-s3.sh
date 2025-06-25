#!/bin/bash


EXPORT_DIR="/home/ubuntu/export"
BUCKET="<BUCKET_NAME>"
REGION="ap-southeast-1"


LOG_FILE="/home/ubuntu/s3_sync.log"


echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting sync S3..." >> "$LOG_FILE"


aws s3 sync "$EXPORT_DIR" "s3://$BUCKET" --delete --region "$REGION" >> "$LOG_FILE" 2>&1

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Done." >> "$LOG_FILE"
echo "---------------------------------------------" >> "$LOG_FILE"
