#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
MQTT_HOST="$(jq --raw-output '.mqttHost' $CONFIG_PATH)"
MQTT_USER="$(jq --raw-output '.mqttUser' $CONFIG_PATH)"
MQTT_PASS="$(jq --raw-output '.mqttPassword' $CONFIG_PATH)"
MAC1="$(jq --raw-output '.macAddress1' $CONFIG_PATH)"
MAC2="$(jq --raw-output '.macAddress2' $CONFIG_PATH)"
devices (.macAddress1, .macAddress2)
node node_modules/.bin/am43ctrl devices [{@}] "$MAC1""$MAC2" -l 3001 -d --url "$MQTT_HOST" -u "$MQTT_USER" -p "$MQTT_PASS" -d
