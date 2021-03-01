ARG ALPINE_VERSION=3.13.2

FROM alpine:${ALPINE_VERSION} AS build

ENV RELEASE_STAMP=20210226
ENV RELEASE_VERSION=10.9.0

RUN apk add --no-cache wget \
&&	wget https://azcopyvnext.azureedge.net/release${RELEASE_STAMP}/azcopy_linux_amd64_${RELEASE_VERSION}.tar.gz -O /tmp/azcopy.tgz \
&&	export BIN_LOCATION=$(tar -tzf /tmp/azcopy.tgz | grep "/azcopy") \
&&	tar -xzf /tmp/azcopy.tgz $BIN_LOCATION --strip-components=1 -C /usr/bin

FROM alpine:${ALPINE_VERSION} AS final

VOLUME /blobs

RUN apk update && apk add libc6-compat ca-certificates
COPY --from=build /usr/bin/azcopy /usr/local/bin/azcopy
RUN ldd /usr/local/bin/azcopy

ENTRYPOINT ["azcopy"]
CMD ["--version"]