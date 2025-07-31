#!/bin/bash

set -exuo pipefail

OBJECT_TYPE=$1

# Read from env or default
HOST="${INFOBLOX_HOST:?INFOBLOX_HOST not set}"
USER="${INFOBLOX_USERNAME:?INFOBLOX_USERNAME not set}"
PASS="${INFOBLOX_PASSWORD:?INFOBLOX_PASSWORD not set}"
WAPI_VERSION="${INFOBLOX_WAPI_VERSION:-v2.10}"

# Full URL to list object types
URL="https://${HOST}/wapi/${WAPI_VERSION}/${OBJECT_TYPE}?_schema"

# Make the request
echo "Connecting to ${URL}..."
curl -s -k -u "${USER}:${PASS}" -X GET "${URL}" | jq '.supported_objects'
