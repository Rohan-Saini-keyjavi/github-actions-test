FROM node:20-alpine AS builder
 
WORKDIR /app
 
# Copy package files and lock file
COPY apps/frontend/package.json ./
 
# Install dependencies
RUN npm install
 
# Copy source files
COPY apps/frontend/ ./
 
# Build the application
RUN npm run build
 
# Production image
FROM node:20-alpine
 
WORKDIR /app
 
# Copy build output from builder stage
COPY --from=builder /app/dist /app/dist
 
# Install serve to run the application
RUN npm install -g serve
 
# Expose the port the app runs on
ENV PORT=8080
EXPOSE 8080
 
# Start the application
CMD ["serve", "-s", "dist", "-l", "8080"]
