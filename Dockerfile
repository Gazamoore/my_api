FROM dunglas/frankenphp

ENV APP_ENV=prod SERVER_NAME=:80
RUN install-php-extensions intl opcache zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
WORKDIR /app
COPY . .
RUN composer install --no-dev --optimize-autoloader --no-scripts \
    && mkdir -p var && chmod -R 777 var
