#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

exec python /usbrelayd \
  --broker="$(bashio::config 'mqtt_broker')" \
  --client="$(bashio::config 'mqtt_client')" \
  --username="$(bashio::config 'mqtt_username')" \
  --password="$(bashio::config 'mqtt_password')"
