#!/bin/bash

set -e
CLOUDFLARE_API_TOKEN="<TOKEN>"
ZONE_ID="<ZONE_ID>"
RECORD_NAME="infra-lab.linhdevops.cloud"

ELB=$(curl -s ifconfig.me)

if [ -z "$ELB" ]; then
  echo "Public IP not found. Exiting."
  exit 1
fi

echo "Public IP: $ELB"

sudo snap install jq
# === Find ID of DNS recently record ===
RECORD_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records?type=A&name=${RECORD_NAME}" \
     -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
     -H "Content-Type: application/json" | jq -r '.result[0].id')

if [ "$RECORD_ID" != "null" ]; then
  echo "Updating DNS record..."
  curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/${RECORD_ID}" \
       -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
       -H "Content-Type: application/json" \
       --data '{"type":"A","name":"'"${RECORD_NAME}"'","content":"'"${ELB}"'","ttl":1,"proxied":true}' | jq
else
  echo "DNS record does not exist, creating new..."
  curl -s -X POST "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records" \
       -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
       -H "Content-Type: application/json" \
       --data '{"type":"A","name":"'"${RECORD_NAME}"'","content":"'"${ELB}"'","ttl":1,"proxied":true}' | jq
fi

