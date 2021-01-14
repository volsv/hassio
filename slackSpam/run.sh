#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
SLACK_URL="$(jq --raw-output '.slackUrl' $CONFIG_PATH)"
SLACK_EMAIL="$(jq --raw-output '.slackEmail' $CONFIG_PATH)"
SLACK_PASSWORD="$(jq --raw-output '.slackPassword' $CONFIG_PATH)"
SLACK_CHAT_URL="$(jq --raw-output '.slackChatUrl' $CONFIG_PATH)"

npm install puppeteer-core@3.0.0 minimist && node index.js --slackUrl="$SLACK_URL" --slackEmail="$SLACK_EMAIL" --slackPassword="$SLACK_PASSWORD" --slackChatUrl="$SLACK_CHAT_URL"