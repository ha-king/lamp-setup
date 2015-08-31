#!/bin/bash
# ******************************************
# Program: LAMP Stack Installation Script
# Developer: Tre King
# Date: 08-23-2015
# Last Updated: 08-23-2015
# ******************************************

if [ "`lsb_release -is`" == "Ubuntu" ] || [ "`lsb_release -is`" == "Debian" ]
then
    sudo apt-get -y update;
    sudo apt-get -y upgrade;
    sudo apt-get -y install mysql-server mysql-client mysql-workbench libmysqld-dev php5-mysql;
    sudo mysql_secure_installation;
    sudo apt-get -y install apache2 php5 libapache2-mod-php5 php5-mcrypt php5-gd php5-curl php5-common php5-cli git unzip logwatch python-mysqldb awscli;
    sudo printf "<?php\nphpinfo();\n?>" > /var/www/html/info.php;
    sudo service apache2 restart;
    sudo cd /var/www/;
    sudo mkdir /var/www/vhosts;
    sudo chmod 777 -R /var/www/vhosts/;
    sudo git clone -b develop https://'3king:Ip00p00!'@bitbucket.org/infascination/avhc.git;
    sudo git clone -b auto https://'3king:Ip00p00!'@bitbucket.org/infascination/wp-setup.git;

elif [ "`lsb_release -is`" == "CentOS" ] || [ "`lsb_release -is`" == "RedHat" ]
then
    sudo yum -y install httpd mysql-server mysql-devel php php-mysql php-fpm;
    sudo yum -y install epel-release phpmyadmin rpm-build redhat-rpm-config;
    sudo yum -y install mysql-community-release-el7-5.noarch.rpm proj;
    sudo yum -y install tinyxml libzip mysql-workbench-community;
    sudo chmod 777 -R /var/www/;
    sudo printf "<?php\nphpinfo();\n?>" > /var/www/html/info.php;
    sudo service mysqld restart;
    sudo service httpd restart;
    sudo chkconfig httpd on;
    sudo chkconfig mysqld on;

else
    echo "Unsupported Operating System";
fi
