# Use OpenJDK as base
FROM openjdk:17-jdk

# Set environment variables
ENV TRACCAR_VERSION=5.12

# Download and unzip Traccar server
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://github.com/traccar/traccar/releases/download/v$TRACCAR_VERSION/traccar-other-$TRACCAR_VERSION.zip && \
    unzip traccar-other-$TRACCAR_VERSION.zip -d /opt/traccar && \
    rm traccar-other-$TRACCAR_VERSION.zip

# Set working directory
WORKDIR /opt/traccar

# Expose necessary ports (8082 for web UI, 5055 for GPS data)
EXPOSE 8082 5055

# Start the server
CMD ["./traccar.run"]
