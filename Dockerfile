# Use a specific, stable n8n version for reproducible builds
FROM n8nio/n8n:1.102.4

# Switch to the root user to install system-level packages
USER root

# Install system libraries using Alpine's 'apk' package manager
# Added more dependencies for a stable Puppeteer/Chromium installation
RUN apk update && apk add --no-cache \
    # For PDF Reading
    poppler-utils \
    \
    # For Web Scraping (Puppeteer) - more robust dependency list
    chromium udev ttf-freefont dbus \
    \
    # For Audio/Video Processing
    ffmpeg \
    \
    # For Advanced Image Manipulation
    imagemagick \
    \
    # For common command-line operations
    git curl wget jq

# Switch back to the non-root 'node' user for security and correct paths
USER node

# Install a curated list of essential community nodes
RUN npm exec -- n8n-nodes-install \
    # --- Core AI & LLMs ---
    n8n-nodes-anthropic \
    n8n-nodes-google-generative-ai \
    n8n-nodes-langchain \
    \
    # --- Core Vector Database ---
    n8n-nodes-pinecone \
    \
    # --- Core Data Tools ---
    n8n-nodes-puppeteer \
    n8n-nodes-spreadsheet-file \
    \
    # --- Core Business Tools ---
    n8n-nodes-airtable \
    n8n-nodes-notion \
    n8n-nodes-slack
