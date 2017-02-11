#!/bin/sh
#
# Server
#
# This installs PHP, mariadb, and nginx
# I've been using SequelPro instead of phpMyAdmin,
# so I have cask 'sequel-pro' # sequelpro.com in my brewfile
#
# PHP: /usr/local/etc/php/7.1/php.ini
# FPM: /usr/local/opt/php71/sbin/php71-fpm

brew tap homebrew/homebrew-php # https://github.com/Homebrew/homebrew-php
brew tap homebrew/services

# Download mariandb
brew install mariadb # mysql -uroot

# Download php71
brew install homebrew/php/php71

# Download ngnix
brew install nginx

# Start services : sudo brew services start --all
sudo brew services start homebrew/php/php71
sudo brew services start nginx
sudo brew services start mariadb