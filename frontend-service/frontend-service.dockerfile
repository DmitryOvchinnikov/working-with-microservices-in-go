# Build the Go Binary
FROM golang:1.17-alpine as build_frontend

# Copy the source code into the container.
RUN mkdir /app
COPY . /app

# Build the service binary.
WORKDIR /app
RUN CGO_ENABLED=0 go build -o frontendapp ./cmd/frontend
RUN chmod +x /app/frontendapp

# Build the Go Binary in Alpine.
FROM alpine:latest
RUN mkdir /app
COPY --from=build_frontend /app/frontendapp /app
CMD [ "/app/frontendapp" ]

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="frontendapp" \
      org.opencontainers.image.authors="Dmitry Ovchinnikov <dmitry.v.ovchinnikov@gmail.com>" \
      org.opencontainers.image.source="https://github.com/dmitryovchinnikov/working-with-microservices-in-go/frontend" \
      org.opencontainers.image.revision="${BUILD_REF}" \
      org.opencontainers.image.vendor="Dmitry Ovchinnikov"
