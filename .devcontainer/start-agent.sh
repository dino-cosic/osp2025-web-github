#!/bin/bash
set -e

if [ -z "$AZP_URL" ] || [ -z "$AZP_TOKEN" ] || [ -z "$AZP_POOL" ] || [ -z "$AZP_AGENT_NAME" ]; then
  echo "One or more required environment variables are missing."
  exit 1
fi

echo "Configuring Azure DevOps agent..."

./config.sh --unattended \
  --url "$AZP_URL" \
  --auth pat \
  --token "$AZP_TOKEN" \
  --pool "$AZP_POOL" \
  --agent "$AZP_AGENT_NAME" \
  --acceptTeeEula

echo "Starting agent..."
./run.sh
