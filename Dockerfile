# ----------------------------------------------------------
# n8n 1.102.4 – Render-ready Docker image
# ----------------------------------------------------------
FROM n8nio/n8n:1.102.4

USER root

# System-level dependencies (Alpine)
RUN apk update && apk add --no-cache \
    # PDF utilities
    poppler-utils \
    # Puppeteer / Chromium runtime
    chromium udev ttf-freefont dbus \
    # Audio / video processing
    ffmpeg \
    # Image manipulation
    imagemagick \
    # General tooling
    git curl wget jq

USER node

# Install the community nodes you need in a single layer
# All of these are compatible with n8n 1.102.4
RUN npm exec -- n8n-nodes-install \
    # Core AI & LLMs
    n8n-nodes-anthropic \
    n8n-nodes-google-generative-ai \
    n8n-nodes-langchain \
    # Vector DB
    n8n-nodes-pinecone \
    # Data / scraping
    n8n-nodes-puppeteer \
    n8n-nodes-spreadsheet-file \
    # Business apps
    n8n-nodes-airtable \
    n8n-nodes-notion \
    n8n-nodes-slack \
    # Communication
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
    # Storage & DBs
    n8n-nodes-google-drive \
    n8n-nodes-aws-s3 \
    n8n-nodes-mongodb \
    n8n-nodes-postgres \
    n8n-nodes-mysql \
    n8n-nodes-redis \
    # CRM & payments
    n8n-nodes-hubspot \
    n8n-nodes-salesforce \
    n8n-nodes-pipedrive \
    n8n-nodes-stripe \
    n8n-nodes-paypal \
    # Social & ads
    n8n-nodes-facebook-graph-api \
    n8n-nodes-twitter \
    n8n-nodes-linkedin \
    n8n-nodes-google-ads \
    # DevOps / infra
    n8n-nodes-github \
    n8n-nodes-webhook \
    n8n-nodes-ssh \
    n8n-nodes-datadog \
    n8n-nodes-sentry
