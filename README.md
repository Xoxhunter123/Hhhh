# Hermes + Z.AI + Telegram (Heroku)

A minimal Docker deployment for running Hermes Agent with the native Z.AI
provider and Telegram gateway on Heroku.

## Required Heroku Config Vars

Set these in Heroku. Do not commit real secrets to GitHub:

- `GLM_API_KEY` — your Z.AI API key
- `TELEGRAM_BOT_TOKEN` — token from BotFather
- `TELEGRAM_ALLOWED_USERS` — your numeric Telegram user ID

The included Hermes config uses:

```yaml
model:
  provider: zai
  default: glm-5
```

## Deploy

1. Upload/push this repository to GitHub.
2. Create a Heroku app.
3. Configure the required Config Vars.
4. Deploy using the included Docker/Heroku configuration.
5. Ensure the `worker` process is running.

## Important

This project does not add an artificial message/token quota. Z.AI API quotas,
rate limits and model context limits still apply.

Heroku's local filesystem is ephemeral. Hermes state written to `/opt/data`
can therefore be lost when the dyno is replaced or restarted. If persistent
Hermes sessions/files/memory are required, use hosting with persistent volumes
or add an external persistence mechanism.
