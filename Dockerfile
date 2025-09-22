FROM alpine:3.22

# renovate: datasource=repology depName=alpine_3_22/bird2 versioning=loose
ENV BIRD_VERSION="2.17.1-r0"

RUN apk add --no-cache bird2="${BIRD_VERSION}"

RUN mkdir -p /run/bird /etc/bird

ENTRYPOINT ["/usr/sbin/bird"]
CMD ["-d", "-s", "/var/run/bird/bird.ctl", "-c", "/etc/bird/bird.conf"]
