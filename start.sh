#!/usr/bin/env bash
set -e

export HERMES_HOME="${HERMES_HOME:-/opt/data}"
mkdir -p "$HERMES_HOME"

if [ ! -f "$HERMES_HOME/config.yaml" ]; then
    cp /tmp/hermes-config.yaml "$HERMES_HOME/config.yaml"
fi

{
    echo "GLM_API_KEY=${GLM_API_KEY}"
    if [ -n "${GLM_BASE_URL:-}" ]; then
        echo "GLM_BASE_URL=${GLM_BASE_URL}"
    fi
    echo "TELEGRAM_BOT_TOKEN=${TELEGRAM_BOT_TOKEN}"
    echo "TELEGRAM_ALLOWED_USERS=${TELEGRAM_ALLOWED_USERS}"
    if [ -n "${TELEGRAM_WEBHOOK_URL:-}" ]; then
        echo "TELEGRAM_WEBHOOK_URL=${TELEGRAM_WEBHOOK_URL}"
    fi
    if [ -n "${TELEGRAM_WEBHOOK_SECRET:-}" ]; then
        echo "TELEGRAM_WEBHOOK_SECRET=${TELEGRAM_WEBHOOK_SECRET}"
    fi
} > "$HERMES_HOME/.env"

chmod 600 "$HERMES_HOME/.env"
exec hermes gateway run
