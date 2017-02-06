FROM alpine:3.4
MAINTAINER matthias.becker@upb.de
# fetch dnsmasq and webproc binary
RUN apk update \
	&& apk add --no-cache dnsmasq
#configure dnsmasq
run mkdir -p /etc/default/
RUN mkdir -p /tftpboot
#RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq
COPY dnsmasq.conf /etc/dnsmasq.conf
#run!
CMD ["dnsmasq","-k"]
