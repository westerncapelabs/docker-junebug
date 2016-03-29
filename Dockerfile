FROM praekeltfoundation/python-base
MAINTAINER Praekelt Foundation <dev@praekeltfoundation.org>

RUN apt-get-install.sh nginx
RUN apt-get-install.sh supervisor
RUN apt-get-install.sh gcc
RUN apt-get-install.sh python-pip
RUN apt-get-install.sh python-dev
RUN apt-get-install.sh libjpeg-dev
RUN apt-get-install.sh zlib1g-dev
RUN pip install vxyowsup
RUN pip install -q junebug

RUN mkdir -p /etc/supervisor/conf.d/
RUN mkdir -p /var/log/supervisor
RUN rm /etc/nginx/sites-enabled/default

# TODO: Add conf files

COPY ./junebug-entrypoint.sh /scripts/
EXPOSE 8080

ENTRYPOINT ["eval-args.sh", "dinit", "junebug-entrypoint.sh"]

CMD []
