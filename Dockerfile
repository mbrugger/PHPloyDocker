FROM alpine:3.3

MAINTAINER Martin Brugger <martin@brugger.eu>
RUN apk add --update \
    ca-certificates \
    bash \
    git \
    mercurial \
    php-bz2 \
    php-cli \
    php-dom \
    php-gd \
    php-json \
    php-ftp \
    php-mcrypt \
    php-openssl \
    php-pdo \
    php-pear \
    php-phar \
    php-zip \
    php-ctype \
    php-zlib \
    subversion \
    unrar \
    perl \
    && rm -rf /var/cache/apk/*

WORKDIR /root
RUN git clone --depth 1 https://github.com/banago/PHPloy.git \
		&& mv PHPloy/bin/phploy.phar /usr/bin/phploy \
		&& rm -rf PHPloy

WORKDIR /repository
ENTRYPOINT ["/usr/bin/phploy"]
