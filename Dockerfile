# Start from the official n8n image for your version
FROM n8nio/n8n:1.102.4

# Switch to the root user to install all the necessary software
USER root

#==============================================================================
# INSTALL ESSENTIAL SYSTEM LIBRARIES (using apk for Alpine Linux)
# This is the corrected command block for the n8n base image.
#==============================================================================
RUN apk update && apk add --no-cache \
    # --- For PDF Reading ---
    poppler-utils \
    \
    # --- For Web Scraping & Browser Automation (Puppeteer Node) ---
    chromium \
    \
    # --- For Video & Audio Processing ---
    ffmpeg \
    \
    # --- For Advanced Image Manipulation ---
    imagemagick \
    \
    # --- For Reading Text from Images (OCR) ---
    tesseract-ocr \
    \
    # --- General Command-Line Utilities ---
    git \
    curl \
    wget \
    jq

#==============================================================================
# INSTALL POPULAR COMMUNITY NODES (This part was correct and stays the same)
#==============================================================================
RUN n8n-nodes-install \
    # --- AI & Large Language Models ---
    n8n-nodes-anthropic \
    n8n-nodes-cohere \
    n8n-nodes-google-generative-ai \
    n8n-nodes-hugging-face \
    n8n-nodes-ollama \
    n8n-nodes-langchain \
    n8n-nodes-replicate \
    n8n-nodes-image-generation \
    \
    # --- Vector Databases ---
    n8n-nodes-pinecone \
    n8n-nodes-qdrant \
    n8n-nodes-weaviate \
    n8n-nodes-chroma \
    \
    # --- Data Gathering & Processing ---
    n8n-nodes-puppeteer \
    n8n-nodes-firecrawl \
    n8n-nodes-serpapi \
    n8n-nodes-apify \
    n8n-nodes-tesseract \
    n8n-nodes-assemblyai-stt \
    n8n-nodes-spreadsheet-file \
    n8n-nodes-markdown \
    \
    # --- Business & Communication Tools ---
    n8n-nodes-airtable \
    n8n-nodes-notion \
    n8n-nodes-slack \
    n8n-nodes-discord \
    n8n-nodes-sendgrid \
    n8n-nodes-hubspot \
    n8n-nodes-google-sheets-advanced \
    \
    # --- Developer & Utility Tools ---
    n8n-nodes-ssh \
    n8n-nodes-moment \
    n8n-nodes-zod \
    n8n-nodes-crypto \
    n8n-nodes-posthog

# Switch back to the safe, non-root user to run the n8n application
USER node
