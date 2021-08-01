FROM internetsystemsconsortium/bind9:9.11
MAINTAINER BIND 9 Developers <bind9-dev@isc.org>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8

RUN apt-get -qqqy update
RUN apt-get -qqqy install wget apt-transport-https
RUN wget -q http://www.webmin.com/jcameron-key.asc -O- | apt-key add -

RUN add-apt-repository -y "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib"
RUN apt-get -qqqy install webmin
EXPOSE 10000/tcp
CMD ["/usr/sbin/init"]