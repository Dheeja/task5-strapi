# Use official Node.js 18 Alpine image
FROM node:18-alpine

# Install needed dependencies for Strapi & native modules
RUN apk add --no-cache python3 make g++ libc6-compat

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# Copy the rest of the application code
COPY . .

# Copy environment variables if needed
COPY .env.example .env

# Build the Strapi admin panel
RUN npm run build

# Expose default Strapi port
EXPOSE 1337

# Start Strapi server
CMD ["npm", "run", "start"]
