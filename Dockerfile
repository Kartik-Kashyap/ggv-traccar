FROM openjdk:17-jdk

# Set version
ENV TRACCAR_VERSION=5.12

# Install required tools
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://github.com/traccar/traccar/releases/download/v${TRACCAR_VERSION}/traccar-other-${TRACCAR_VERSION}.zip && \
    unzip traccar-other-${TRACCAR_VERSION}.zip -d /opt/traccar && \
    rm traccar-other-${TRACCAR_VERSION}.zip

# Set working directory
WORKDIR /opt/traccar

# Expose necessary ports
EXPOSE 8082 5055

# Start Traccar server
CMD ["./traccar.run"]
