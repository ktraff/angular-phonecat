#!/usr/bin/env bash

apt-get install -y python-software-properties
add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get install -y apache2
apt-get install -y php5 php5-mysql
apt-get install -y php5 libapache2-mod-php5 php5-mcrypt
apt-get install -y nodejs

# Configure Apache to serve our website publicly
if [ ! -h /var/www ]; 
then 

    rm -rf /var/www
    ln -fs /vagrant /var/www

    a2enmod rewrite

    sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default

    service apache2 restart
fi

# Setup development environment
apt-get install -y vim
apt-get install -y git
apt-get install -y unzip
