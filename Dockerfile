FROM lsiobase/ubuntu:bionic

LABEL maintainer 'Sam Burney <sam@burney.io>'

RUN apt-get update && \
    apt-get install -fy all-knowing-dns && \
    apt-get clean

RUN rm /etc/all-knowing-dns.conf

ADD ./root/ /

EXPOSE 53/tcp
EXPOSE 53/udp

ENTRYPOINT [ "/init" ]
