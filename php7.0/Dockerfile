FROM ubuntu:20.04

LABEL maintainer="Bozboz"

WORKDIR /var/www/html

ENV HOME /var/www
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y apt-transport-https build-essential gnupg gosu curl ca-certificates zip unzip git libcap2-bin libpng-dev \
    && mkdir -p ~/.gnupg \
    && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
    && apt-key adv --homedir ~/.gnupg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E5267A6C \
    && apt-key adv --homedir ~/.gnupg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C300EE8C \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" > /etc/apt/sources.list.d/ppa_ondrej_php.list \
    && apt-get update \
    && apt-get install -y php7.0-cli php7.0-dev \
       php7.0-sqlite3 php7.0-gd \
       php7.0-curl php7.0-memcached php7.0-imagick \
       php7.0-imap php7.0-mysql php7.0-mbstring \
       php7.0-xml php7.0-zip php7.0-bcmath php7.0-soap \
       php7.0-intl php7.0-readline \
       php7.0-msgpack php7.0-igbinary php7.0-ldap \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_15.x | bash - \
    && apt-get install -y mysql-client \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN touch ~/.bashrc
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

ADD ./boz-cli $HOME/boz-cli
ENV PATH $HOME/boz-cli:$PATH
