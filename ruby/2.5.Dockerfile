FROM BASE_IMAGE

LABEL authors="Paulo Rogério"

MAINTAINER paulo.gsilva@nexoos.com.br

ENV RUBY_VERSION="ruby2.5"

RUN echo "deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/brightbox-ubuntu-ruby-ng-bionic.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F5DA5F09C3173AA6
RUN apt-get update && apt-get install -y ${RUBY_VERSION} ${RUBY_VERSION}-dev
RUN apt-get autoremove -y --purge

RUN apt-get clean
