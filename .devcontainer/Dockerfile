FROM debian:bullseye-slim
ARG DEBIAN_FRONTEND=noninteractive
USER root
COPY php.ini /tmp

# Update package list
RUN echo "Updating package list" \
    && apt-get update -yq

# Add updated PHP sources
RUN echo "Adding updated PHP sources" \
    && apt-get install curl -yq \
    && curl -sSL https://packages.sury.org/php/README.txt | bash -x \
    && apt-get update -yq

# Install some common packages
RUN echo "Installing common packages" \
    && apt-get install git imagemagick nano openssh-server sqlite3 wget unzip -yq

# Modify ImageMagick policy to allow PDF read/write
RUN echo "Modifying ImageMagick policy to allow PDF read/write" \
    && sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<policy domain="coder" rights="read|write" pattern="PDF" \/>/g' /etc/ImageMagick-6/policy.xml

# Install PHP CLI with some extensions for Drupal development
RUN echo "Installing PHP CLI with extensions for Drupal development" \
    && apt-get install php8.2-dev php8.2-xml -yq \
    && apt-get install php8.2-apcu php8.2-curl php8.2-gd php8.2-imagick php8.2-mbstring php8.2-sqlite3 php8.2-zip -yq

# Configure PHP and install xdebug
RUN echo "Configuring PHP and installing xdebug" \
    && pear config-set php_ini /etc/php/8.2/cli/php.ini \
    && pecl install xdebug \
    && cat /tmp/php.ini >> /etc/php/8.2/cli/php.ini

# Install NodeJS LTS
RUN echo "Installing NodeJS LTS" \
    && curl -sL https://deb.nodesource.com/setup_lts.x | bash \
    && apt-get install nodejs -yq

# Install Composer
RUN echo "Installing Composer" \
    && wget https://getcomposer.org/installer \
    && php installer --install-dir=/usr/local/bin --filename=composer \
    && rm installer

# Install global Drush launcher
RUN echo "Installing global Drush launcher" \
    && wget -O /usr/local/bin/drush https://github.com/drush-ops/drush-launcher/releases/latest/download/drush.phar \
    && chmod +x /usr/local/bin/drush

# Clean up some things
RUN echo "Cleaning up" \
    && rm /tmp/php.ini \
    && rm -rf /var/lib/apt/lists/*

# Create a user
RUN echo "Creating a user" \
    && useradd -m drupal -p drupal

USER drupal
ENV SHELL /bin/bash