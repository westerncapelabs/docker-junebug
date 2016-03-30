FROM praekeltfoundation/supervisor
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>

RUN apt-get-install.sh libjpeg62
RUN apt-get-install.sh nginx
RUN pip install -q junebug
COPY ./docker/nginx.conf /etc/supervisor/conf.d/nginx.conf
COPY ./docker/junebug.conf /etc/supervisor/conf.d/junebug.conf
COPY ./junebug-entrypoint.sh /scripts/
EXPOSE 8080
