FROM alpine:3.21.3

RUN apk add nmap nmap-scripts libcap-setcap && \
    addgroup -S nmap && \
    adduser -S nmap -G nmap && \
    setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip /usr/bin/nmap
USER nmap
HEALTHCHECK NONE

ENTRYPOINT [ "/usr/bin/nmap", "--privileged" ]
