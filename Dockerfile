# Use an official Go image to build
FROM golang:1.22-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy all files to the working directory
COPY . .

# Download the modules and build the application
RUN go mod download
RUN go build -o main .

# Create a lightweight image for runtime
FROM alpine:latest
WORKDIR /app

# Copy the executable file from the builder
COPY --from=builder /app/main .

# Expose the application's port
EXPOSE 8080

# Run the application
CMD ["./main"]
