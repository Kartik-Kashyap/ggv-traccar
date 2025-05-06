FROM openjdk:17-jdk-alpine

# Set version
ENV TRACCAR_VERSION=5.12

# Install required tools using Alpine's package manager
RUN apk add --no-cache wget unzip && \
    wget https://github.com/traccar/traccar/releases/download/v${TRACCAR_VERSION}/traccar-other-${TRACCAR_VERSION}.zip && \
    unzip traccar-other-${TRACCAR_VERSION}.zip -d /opt/traccar && \
    rm traccar-other-${TRACCAR_VERSION}.zip

# Set working directory
WORKDIR /opt/traccar

# Expose necessary ports (Web UI and GPS tracking port)
EXPOSE 8082 5055

# Run Traccar
CMD ["./traccar.run"]
