FROM alpine:3.4
MAINTAINER matthias.becker@upb.de
# fetch dnsmasq and webproc binary
RUN apk update \
	&& apk add --no-cache dnsmasq
#configure dnsmasq
RUN mkdir -p /etc/default/
RUN mkdir -p /tftpboot
#run!
CMD ["dnsmasq", "-k"]
