FROM praekeltfoundation/supervisor
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>

RUN apt-get-install.sh gcc python-pip python-dev libjpeg-dev zlib1g-dev
RUN pip install vxyowsup
RUN pip install -q junebug
COPY ./docker/nginx.conf /etc/supervisor/conf.d/nginx.conf
COPY ./docker/junebug.conf /etc/supervisor/conf.d/junebug.conf
COPY ./junebug-entrypoint.sh /scripts/
EXPOSE 8080
