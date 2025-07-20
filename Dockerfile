# Use a specific, stable n8n version for reproducible builds
FROM n8nio/n8n:1.102.4

# Switch to the root user to install system-level packages
USER root

# Install system libraries using Alpine's 'apk' package manager
RUN apk update && apk add --no-cache \
    # For PDF Reading
    poppler-utils \
    # For Web Scraping (Puppeteer)
    chromium \
    # For Audio/Video Processing
    ffmpeg \
    # For Advanced Image Manipulation
    imagemagick \
    # For OCR (Reading Text from Images)
    tesseract-ocr \
    # For common command-line operations
    git \
    curl \
    wget \
    jq

# Switch back to the non-root 'node' user for security
USER node

# Install community nodes using 'npm exec'. This is the robust, standard method.
# The '--' separates the npm command from the arguments for the script.
RUN npm exec -- n8n-nodes-install \
    n8n-nodes-anthropic \
    n8n-nodes-cohere \
    n8n-nodes-google-generative-ai \
    n8n-nodes-hugging-face \
    n8n-nodes-ollama \
    n8n-nodes-langchain \
    n8n-nodes-replicate \
    n8n-nodes-image-generation \
    n8n-nodes-pinecone \
    n8n-nodes-qdrant \
    n8n-nodes-weaviate \
    n8n-nodes-chroma \
    n8n-nodes-puppeteer \
    n8n-nodes-firecrawl \
    n8n-nodes-serpapi \
    n8n-nodes-apify \
    n8n-nodes-tesseract \
    n8n-nodes-assemblyai-stt \
    n8n-nodes-spreadsheet-file \
    n8n-nodes-markdown \
    n8n-nodes-airtable \
    n8n-nodes-notion \
    n8n-nodes-slack \
    n8n-nodes-discord \
    n8n-nodes-sendgrid \
    n8n-nodes-hubspot \
    n8n-nodes-google-sheets-advanced \
    n8n-nodes-ssh \
    n8n-nodes-moment \
    n8n-nodes-zod \
    n8n-nodes-crypto \
    n8n-nodes-posthog
