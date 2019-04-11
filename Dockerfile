FROM lsiobase/alpine:3.9

LABEL maintainer 'Sam Burney <sam@burney.io>'

RUN apk add --update \
    git \
    perl perl-net-dns \
    perl-utils make gcc musl-dev perl-dev \
    && cpan install Mouse MouseX::NativeTraits NetAddr::IP::Util Privileges::Drop \
    && apk del perl-utils make gcc musl-dev perl-dev \
    && rm -rf /root/.cpan \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

RUN git clone https://github.com/samburney/all-knowing-dns.git /usr/local/share/all-knowing-dns

ADD ./root/ /

EXPOSE 53/tcp
EXPOSE 53/udp

ENTRYPOINT [ "/init" ]
