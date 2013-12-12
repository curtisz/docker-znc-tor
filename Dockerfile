# This file creates a container that runs ZNC through tor
#
# Author: Patrick Kettner
# Date: 11/12/2013


FROM stackbrew/ubuntu:13.10
MAINTAINER Patrick Kettner "patrickkettner@gmail.com"

RUN apt-get update
RUN apt-get -y install znc tor proxychains

ADD start-znc /usr/local/bin/start-znc
ADD znc.pem /opt/znc/znc.pem
ADD znc.conf /opt/znc/configs/znc.conf

RUN chmod +x /usr/local/bin/start-znc 

RUN useradd znc
RUN chown -R znc:znc /opt/znc

EXPOSE 6667

# Start znc
CMD ["proxychains start-znc"]
