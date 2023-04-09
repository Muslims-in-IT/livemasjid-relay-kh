# Dockerfile for Icecast-KH using Alpine Linux
FROM alpine:latest
LABEL maintainer="Yusuf Kaka <yusufk@gmail.com>"
RUN addgroup icecast && \
    adduser -D -G icecast icecast && \
    apk add --no-cache curl libtheora libvorbis libogg libxslt libxml2 speex git autoconf make build-base curl-dev libtheora-dev libvorbis-dev libogg-dev libxslt-dev libxml2-dev speex-dev && \
    git clone git@github.com:karlheyes/icecast-kh.git /tmp/icecast-kh && \
    cd /tmp/icecast-kh && \
    ./configure && \
    make && \
    make install && \
    apk del git autoconf make build-base curl-dev libtheora-dev libvorbis-dev libogg-dev libxslt-dev libxml2-dev speex-dev && \
    rm -rf /tmp/icecast-kh
EXPOSE 8000
USER icecast
CMD ["icecast", "-c", "/etc/icecast.xml"]
