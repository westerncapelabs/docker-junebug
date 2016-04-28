FROM praekeltfoundation/supervisor
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>

RUN apt-get-install.sh libjpeg62
RUN pip install -q \
    yowsup2==2.4.102 \
    vxyowsup==0.1.7 \
    vumi==0.6.7 \
    junebug==0.1.5 \
    vxmessenger==1.1.1

COPY ./docker/junebug.conf /etc/supervisor/conf.d/junebug.conf
COPY ./junebug-entrypoint.sh /scripts/

EXPOSE 443
