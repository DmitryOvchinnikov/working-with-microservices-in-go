# Build the Go Binary
FROM golang:1.17-alpine as builder

# Copy the source code into the container.
RUN mkdir /app
COPY . /app
WORKDIR /app

# Build the service binary.
RUN CGO_ENABLED=0 go build -o brokerapp ./cmd/broker
RUN chmod +x /app/brokerapp

# Build the Go Binary in Alpine.
FROM alpine:latest
RUN mkdir /app
COPY --from=builder /app/brokerapp /app
CMD [ "/app/brokerapp" ]

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="brokerapp" \
      org.opencontainers.image.authors="Dmitry Ovchinnikov <dmitry.v.ovchinnikov@gmail.com>" \
      org.opencontainers.image.source="https://github.com/dmitryovchinnikov/working-with-microservices-in-go/broker" \
      org.opencontainers.image.revision="${BUILD_REF}" \
      org.opencontainers.image.vendor="Dmitry Ovchinnikov"
