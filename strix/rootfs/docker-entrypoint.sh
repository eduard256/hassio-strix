#!/usr/bin/env bash
set -e

# Function to get config values
get_config() {
    local key=$1
    local default=$2

    if [ -f /data/options.json ]; then
        value=$(jq -r ".$key // \"$default\"" /data/options.json)
        echo "$value"
    else
        echo "$default"
    fi
}

# Get configuration
LOG_LEVEL=$(get_config "log_level" "info")
PORT=$(get_config "port" "4567")

# Export environment variables
export STRIX_LOG_LEVEL="$LOG_LEVEL"
export STRIX_API_LISTEN=":$PORT"
export STRIX_LOG_FORMAT="json"

# Print startup info
echo "Starting Strix Camera Stream Discovery System"
echo "Version: 1.0.3"
echo "Port: $PORT"
echo "Log Level: $LOG_LEVEL"

# Start Strix
cd /app
exec ./strix
