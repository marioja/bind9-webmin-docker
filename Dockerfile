FROM internetsystemsconsortium/bind9:9.11
ARG RECURSION_SUBNET=10.0.0/24
MAINTAINER BIND 9 Developers <bind9-dev@isc.org>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8

RUN echo "allow-recursion { ${RECURSION_SUBNET}; };" >/tmp/recursion.txt
RUN sed -i -e '/listen-on-v6/r /tmp/recursions.txt' /var/etc/bind/named.conf.options
RUN apt-get -qqqy update
RUN apt-get -qqqy install wget apt-transport-https
RUN wget -q http://www.webmin.com/jcameron-key.asc -O- | apt-key add -

RUN add-apt-repository -y "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib"
RUN apt-get -qqqy install webmin
EXPOSE 10000/tcp
CMD ["/bin/sh", "-c", "/etc/init.d/webmin start&/usr/sbin/named -g -c /etc/bind/named.conf -u bind"]