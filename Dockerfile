# Dockerfile for Icecast-KH using Alpine Linux and a tar file from the Icecast-KH GIT repo
FROM alpine:latest
LABEL maintainer="Yusuf Kaka <yusufk@gmail.com>"
RUN addgroup icecast && \
    adduser -D -G icecast icecast && \
    apk add --no-cache curl libtheora libvorbis libogg libxslt libxml2 speex autoconf make build-base curl-dev libtheora-dev libvorbis-dev libogg-dev libxslt-dev libxml2-dev speex-dev && \
    mkdir -p /tmp/icecast-kh && \
    curl -L https://github.com/karlheyes/icecast-kh/archive/refs/tags/icecast-2.4.0-kh20.1.tar.gz | tar -xz -C /tmp/icecast-kh --strip-components=1 && \
    cd /tmp/icecast-kh && \
    ./configure && \
    make && \
    make install && \
    apk del autoconf make build-base curl-dev libtheora-dev libvorbis-dev libogg-dev libxslt-dev libxml2-dev speex-dev && \
    rm -rf /tmp/icecast-kh &&\
    cp /usr/local/share/icecast/doc/icecast.xml.dist /etc/icecast.xml

RUN chown icecast /etc/icecast.xml
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8000
USER icecast
ENTRYPOINT ["/entrypoint.sh"]
CMD ["icecast", "-c", "/etc/icecast.xml"]
