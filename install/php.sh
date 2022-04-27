#!/bin/sh

kernelName="$(uname -s)"

if [ "$kernelName" = "Linux" ]; then
  # Install PHP only on Linux PCs
  sudo apt-get -qq install lsb-release \
    ca-certificates \
    apt-transport-https \
    software-properties-common

  sudo add-apt-repository ppa:ondrej/php
  sudo apt update
  sudo apt-get -qq install php8.0
fi

# Install last version of Composer (as shown here: https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md)
COMPOSER_PATH=/usr/local/bin

cd /tmp
EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum for composer'
    rm composer-setup.php
fi

php composer-setup.php --quiet
RESULT=$?
sudo mv /tmp/composer.phar /usr/local/bin/composer
rm composer-setup.php