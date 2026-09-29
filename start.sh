#!/usr/bin/env bash
set -e

export HERMES_HOME=/opt/data
export HOME=/opt/data

mkdir -p /opt/data

cp /tmp/hermes-config.yaml /opt/data/config.yaml

cat > /opt/data/.env <<EOF
GLM_API_KEY=${GLM_API_KEY}
TELEGRAM_BOT_TOKEN=${TELEGRAM_BOT_TOKEN}
TELEGRAM_ALLOWED_USERS=${TELEGRAM_ALLOWED_USERS}
EOF

chmod 600 /opt/data/.env

echo "[heroku] Starting Hermes gateway"
echo "[heroku] Telegram token configured: $([ -n "${TELEGRAM_BOT_TOKEN:-}" ] && echo yes || echo no)"
echo "[heroku] Telegram allowlist configured: $([ -n "${TELEGRAM_ALLOWED_USERS:-}" ] && echo yes || echo no)"
echo "[heroku] Z.AI key configured: $([ -n "${GLM_API_KEY:-}" ] && echo yes || echo no)"

exec hermes gateway run
