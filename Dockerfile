FROM debian:13-slim

# renovate: datasource=repology depName=debian_13/bird2 versioning=loose
ENV BIRD_VERSION="2.17.1-1"

RUN apt-get update && \
    apt-get install -y \
    bird2="${BIRD_VERSION}" \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/bird /etc/bird

ENTRYPOINT ["/usr/sbin/bird"]
CMD ["-d", "-s", "/var/run/bird/bird.ctl", "-c", "/etc/bird/bird.conf"]
