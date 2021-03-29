# Container image that runs your code
FROM alpine:3.10

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

# Install and Initialize Ritchie CLI
RUN apk add --no-cache curl bash sudo make
RUN curl -fsSL https://commons-repo.ritchiecli.io/install.sh | bash
RUN echo '{"addCommons":false, "sendMetrics":true, "runType":"local"}' | rit init --stdin

# Install Maven & Java 8
RUN apk add --no-cache maven openjdk8
