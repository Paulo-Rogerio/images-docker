FROM ubuntu:latest

LABEL authors="Paulo Rogério"
MAINTAINER paulo.gsilva@nexoos.com.br

ARG POSTGRESQL_VERSION="10"
ARG NODE_VERSION="14"

ENV TZ=America/Sao_Paulo
ENV DEBIAN_FRONTEND='noninteractive' 

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone && \
    apt-get update && \
    apt-get install -y curl tzdata gnupg2

#========= Repositórios =========#
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    curl -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

#=========== Pacotes ============#
RUN apt-get update && \
    apt-get install -y build-essential \
    libssl-dev \
    libxml2-dev \
    nodejs \ 
    libmagick++-dev \
    libxslt-dev \
    git \
    libsqlite3-dev \
    xvfb \
    libfontconfig \
    wkhtmltopdf \
    ucommon-utils \
    language-pack-en \
    sudo 

RUN echo ${POSTGRESQL_VERSION} \
    apt-get update && \
    apt-get -y postgresql-client-${POSTGRESQL_VERSION} \
    libpq-dev

#============== NPM =============#
RUN npm install -g yarn bower && \
    npm cache clean --force

#============== SSH =============#
RUN mkdir /root/.ssh && \ 
    echo "Host *\nStrictHostKeyChecking no" > /root/.ssh/config && \
    chmod 0400 /root/.ssh/config && \
    rm -f /bin/sh && ln -svf /bin/bash /bin/sh

#=========== Usuários ===========#
RUN groupadd -g 1000 sistemas && \
    useradd -g 1000 -u 1000 -m -s "/bin/false" -c "Usuario Aplicação - Rails" sistemas 

#======== Permissoes Sudo =======#
RUN echo "sistemas ALL=(ALL) NOPASSWD: /bin/ln" > /etc/sudoers.d/99_usuario_sistemas