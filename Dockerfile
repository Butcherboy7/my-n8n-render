# ----------------------------------------------------------
# n8n 1.102.4 – Render-ready Docker image
# (works around the missing n8n-nodes-install helper)
# ----------------------------------------------------------
FROM n8nio/n8n:1.102.4

USER root

# System-level dependencies (unchanged)
RUN apk update && apk add --no-cache \
    poppler-utils \
    chromium udev ttf-freefont dbus \
    ffmpeg \
    imagemagick \
    git curl wget jq

# Switch to the node user **before** installing community nodes
USER node

# Community nodes – install directly into the n8n user directory
# (the trailing “@latest” is optional but keeps the syntax explicit)
RUN cd /home/node/.n8n && \
    npm install \
        n8n-nodes-anthropic@latest \
        n8n-nodes-google-generative-ai@latest \
        n8n-nodes-langchain@latest \
        n8n-nodes-pinecone@latest \
        n8n-nodes-puppeteer@latest \
        n8n-nodes-spreadsheet-file@latest \
        n8n-nodes-airtable@latest \
        n8n-nodes-notion@latest \
        n8n-nodes-slack@latest \
        n8n-nodes-gmail@latest \
        n8n-nodes-microsoft-outlook@latest \
        n8n-nodes-telegram@latest \
        n8n-nodes-discord@latest \
        n8n-nodes-twilio@latest \
        n8n-nodes-sendgrid@latest \
        n8n-nodes-resend@latest \
        n8n-nodes-typeform@latest \
        n8n-nodes-calendly@latest \
        n8n-nodes-zoom@latest \
        n8n-nodes-google-drive@latest \
        n8n-nodes-aws-s3@latest \
        n8n-nodes-mongodb@latest \
        n8n-nodes-postgres@latest \
        n8n-nodes-mysql@latest \
        n8n-nodes-redis@latest \
        n8n-nodes-hubspot@latest \
        n8n-nodes-salesforce@latest \
        n8n-nodes-pipedrive@latest \
        n8n-nodes-stripe@latest \
        n8n-nodes-paypal@latest \
        n8n-nodes-facebook-graph-api@latest \
        n8n-nodes-twitter-api@latest \
        n8n-nodes-linkedin@latest \
        n8n-nodes-google-ads@latest \
        n8n-nodes-github@latest \
        n8n-nodes-ssh@latest \
        n8n-nodes-datadog@latest \
        n8n-nodes-sentry@latest

# (Optional) expose port and health-check if you want to customise ENTRYPOINT
EXPOSE 5678
