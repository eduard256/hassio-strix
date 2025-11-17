ARG BUILD_FROM
FROM golang:1.24-alpine AS builder

# Install build dependencies
RUN apk add --no-cache \
    git \
    make \
    gcc \
    musl-dev

# Set working directory
WORKDIR /build

# Clone Strix repository
ARG STRIX_VERSION=main
RUN git clone --depth 1 --branch ${STRIX_VERSION} https://github.com/eduard256/Strix.git .

# Build the application
RUN go mod download && \
    CGO_ENABLED=1 GOOS=linux go build -a -ldflags '-linkmode external -extldflags "-static"' -o strix ./cmd/strix

# Final stage
FROM $BUILD_FROM

# Install runtime dependencies
RUN apk add --no-cache \
    ffmpeg \
    ca-certificates \
    tzdata

# Create app directory
WORKDIR /app

# Copy binary from builder
COPY --from=builder /build/strix /app/strix

# Copy data directory with camera database
COPY --from=builder /build/data /app/data

# Copy web UI
COPY --from=builder /build/webui /app/webui

# Copy entrypoint script
COPY rootfs/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Expose port
EXPOSE 4567

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:4567/api/v1/health || exit 1

# Set entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
