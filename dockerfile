# Dockerfile
FROM gcr.io/distroless/nodejs20
WORKDIR /app
COPY . .
ENV PORT=8080
# server.js should listen on process.env.PORT
CMD ["server.js"]
