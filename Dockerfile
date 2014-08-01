FROM ubuntu:14.04

MAINTAINER sanemat sanemat@tachikoma.io

RUN apt-get -yq update

# install middleware
RUN apt-get install -yq git build-essential curl
RUN apt-get install -yq zlib1g-dev libssl-dev libpq-dev imagemagick libmagickwand-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get install -yq postgresql sqlite memcached mongodb
RUN apt-get install -yq mysql-server-5.6
RUN apt-get install -yq redis-server
RUN apt-get install -yq ruby ruby-dev
RUN apt-get install -yq nodejs nodejs-dev

# Create user
ENV APP_USER appuser
RUN adduser $APP_USER

# Change user
USER appuser
WORKDIR /home/appuser
ENV HOME /home/appuser

RUN git clone https://github.com/tagomoris/xbuild $HOME/xbuild
RUN mkdir -p $HOME/local

# Re change user
USER root
