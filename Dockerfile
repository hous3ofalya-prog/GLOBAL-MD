FROM node:20-slim

# Install dependencies yang dibutuhkan sistem
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Salin file konfigurasi terlebih dahulu
COPY package.json .

# Paksa instalasi dependencies meskipun lockfile tidak ada
RUN npm install --network-timeout=100000

# Salin seluruh file bot
COPY . .

# Jalankan bot
CMD ["node", "index.js"]
