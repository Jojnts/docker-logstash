#!/bin/bash
set -o errexit
set -o nounset

TEST_CONFIG_FILE="$(mktemp)"
trap 'rm -f "$TEST_CONFIG_FILE"' EXIT

echo "Testing configuration"
cp /usr/share/logstash/pipeline/logstash.conf "$TEST_CONFIG_FILE"

if "logstash" -f "$TEST_CONFIG_FILE" --config.test_and_exit; then
  echo "Deploying!"
  exit 0
else
  echo "Aborting deploy!"
  exit 1
fi
