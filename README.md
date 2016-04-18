# docker-junebug
Dockerfile for running [Junebug](http://junebug.readthedocs.org/) with
[Nginx](https://www.nginx.com/).

### Details:
Base image: [`praekeltfoundation/supervisor`](https://hub.docker.com/r/praekeltfoundation/supervisor/)

This is a Debian Jessie base image with the latest version of Python 2 and
Junebug and Nginx installed.

### Usage:

* [Set up Junebug in Mission Control](docs/set-up-junebug-in-mc.md)
* [Create a Vumi Bridge channel](docs/create-vumi-bridge-channel.md)
