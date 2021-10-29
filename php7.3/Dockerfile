FROM ubuntu:20.04

LABEL maintainer="Bozboz"

WORKDIR /var/www/html

ENV HOME /var/www
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y openssh-client rsync apt-transport-https build-essential gnupg gosu curl ca-certificates zip unzip git libcap2-bin libpng-dev \
    && mkdir -p ~/.gnupg \
    && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
    && apt-key adv --homedir ~/.gnupg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E5267A6C \
    && apt-key adv --homedir ~/.gnupg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C300EE8C \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" > /etc/apt/sources.list.d/ppa_ondrej_php.list \
    && apt-get update \
    && apt-get install -y \
    && apt-get install -y php7.3-cli php7.3-dev \
       php7.3-sqlite3 php7.3-gd \
       php7.3-curl php7.3-memcached php7.3-imagick \
       php7.3-imap php7.3-mysql php7.3-mbstring \
       php7.3-xml php7.3-zip php7.3-bcmath php7.3-soap \
       php7.3-intl php7.3-readline \
       php7.3-msgpack php7.3-igbinary php7.3-ldap \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_15.x | bash - \
    && apt-get install -y mysql-client \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

RUN touch ~/.bashrc
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
