FROM php:8.1-cli
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Install extensions
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd intl mysqli opcache pdo-mysql xdebug xsl zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Install Symfony cli
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv ~/.symfony5/bin/symfony /usr/local/bin

# Add git
RUN apt-get update && apt-get install -y git && apt-get clean

WORKDIR /home/server
