# Container image that runs your code
FROM debian:bullseye-slim
LABEL org.opencontainers.image.source="https://github.com/loonwerks/FMIDE-CI-Action-Container"

# Fetch some basics
RUN apt-get update -q \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        libgtk-3-0 \
        tar \
        xauth \
        xvfb \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Copies script for construction of FMIDE tool into the container
COPY make_fmide.sh /make_fmide.sh
RUN chmod +x /make_fmide.sh

# Run the make agree script to download and install FMIDE
RUN /make_fmide.sh

