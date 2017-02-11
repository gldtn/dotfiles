#!/bin/sh
#
# Composer
#
# This installs PHP Composer and Valet for Laravel

# Download composer
php -r "copy('http://getcomposer.org/installer', 'composer-setup.php');"

# Verify the download
#sudo php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

# Install
php composer-setup.php

# Clean-up
php -r "unlink('composer-setup.php');"

# Relocate
mv composer.phar /usr/local/bin/composer

# Check install/version
#composer -V

# Install Valet with Composer
composer global require laravel/valet

# Configure and install Valet and DnsMasq, and 
# register Valet's daemon to launch when your system starts
valet install
sudo brew services start dnsmasq

# test valet
#ping -c 2 foobar.dev

# Create a dir for your sites and tell valet to park it
mkdir ~/Sites  
cd ~/Sites
valet park