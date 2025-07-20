# ----------------------------------------------------------
# n8n 1.102.4 – Render-ready Docker image
# ----------------------------------------------------------
FROM n8nio/n8n:1.102.4

USER root
RUN apk update && apk add --no-cache \
    poppler-utils chromium udev ttf-freefont dbus ffmpeg imagemagick \
    git curl wget jq

USER node

# Install community nodes one-by-one so the first failure is obvious
RUN <<'EOF'
  set -e
  cd /home/node/.n8n
  for pkg in \
    n8n-nodes-anthropic \
    n8n-nodes-google-generative-ai \
    n8n-nodes-langchain \
    n8n-nodes-pinecone \
    n8n-nodes-puppeteer \
    n8n-nodes-spreadsheet-file \
    n8n-nodes-airtable \
    n8n-nodes-notion \
    n8n-nodes-slack \
    n8n-nodes-gmail \
    n8n-nodes-microsoft-outlook \
    n8n-nodes-telegram \
    n8n-nodes-discord \
    n8n-nodes-twilio \
    n8n-nodes-sendgrid \
    n8n-nodes-resend \
    n8n-nodes-typeform \
    n8n-nodes-calendly \
    n8n-nodes-zoom \
    n8n-nodes-google-drive \
    n8n-nodes-aws-s3 \
    n8n-nodes-mongodb \
    n8n-nodes-postgres \
    n8n-nodes-mysql \
    n8n-nodes-redis \
    n8n-nodes-hubspot \
    n8n-nodes-salesforce \
    n8n-nodes-pipedrive \
    n8n-nodes-stripe \
    n8n-nodes-paypal \
    n8n-nodes-facebook-graph-api \
    n8n-nodes-twitter-api \
    n8n-nodes-linkedin \
    n8n-nodes-google-ads \
    n8n-nodes-github \
    n8n-nodes-ssh \
    n8n-nodes-datadog \
    n8n-nodes-sentry
  do
    echo ">>> Installing $pkg"
    npm install "$pkg@latest"
  done
EOF

EXPOSE 5678
