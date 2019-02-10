FROM php:7.2-cli

RUN docker-php-ext-install pdo_mysql

ADD app/ /app
WORKDIR /app

CMD [ "php", "-S", "0.0.0.0:80", "-t", "public" ]

EXPOSE 80