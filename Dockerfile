FROM praekeltfoundation/python-base
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>

RUN apt-get-install.sh nginx
RUN apt-get-install.sh gcc
RUN apt-get-install.sh python-pip
RUN apt-get-install.sh python-dev
RUN apt-get-install.sh libjpeg-dev
RUN apt-get-install.sh zlib1g-dev
RUN pip install vxyowsup
RUN pip install -q junebug

ENV SUPERVISOR_VERSION "3.2.1"
RUN pip install supervisor==$SUPERVISOR_VERSION

RUN rm /etc/nginx/sites-enabled/default

ADD ./supervisor.conf /etc/supervisor/supervisord.conf
RUN mkdir -p /etc/supervisor/conf.d && \
    mkdir -p /var/log/supervisor

# TODO: Add nginx conf files

COPY ./junebug-entrypoint.sh /scripts/
EXPOSE 8080

ENTRYPOINT ["eval-args.sh", "dinit", "junebug-entrypoint.sh"]

CMD []
