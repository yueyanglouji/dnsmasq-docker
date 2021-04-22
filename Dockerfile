FROM alpine:edge
LABEL maintainer="yueyanglouji<343468684@qq.com>"
RUN apk update \
    && apk --no-cache add dnsmasq

#configure dnsmasq
COPY dnsmasq.conf /etc/dnsmasq.conf

ENTRYPOINT ["dnsmasq", "--no-daemon"]