# Use Node.js 20 Alpine as base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better layer caching
COPY package.json  ./

# Install dependencies
RUN npm ci --omit=dev

# Install global dependencies
RUN npm install -g pm2

# Copy application code
COPY . .

# Create .env file from sample
RUN cp sample.env .env

# Expose port
EXPOSE 5002

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:5002/health', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) })" || exit 1

# Start the application
CMD ["npm", "run", "dev"] 