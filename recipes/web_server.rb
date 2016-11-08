#
# Cookbook Name:: laravel
# Recipe:: web_server
#
# Copyright 2013, Mathias Hansen
#

# Makes sure apt is up to date
include_recipe "apt"

#apt_repository 'apache2' do
#	uri 'http://ppa.launchpad.net/ondrej/apache2/ubuntu'
#	distribution node['lsb']['codename']
#	components ['main']
#	keyserver 'keyserver.ubuntu.com'
#	key 'E5267A6C'
#end

# Install Apache & PHP
#include_recipe "openssl"
#include_recipe "apache2"
#apache_module "authz_default" do
#  enable false
#end

bash "install apache2" do
  user "root"
  cwd "/var/www/#{node['laravel']['name']}"
  code <<-EOH
  add-apt-repository ppa:ondrej/apache2
  apt-get -y update
  apt-get -y install apache2
  EOH
end

#include_recipe "php"

# Install Composer
bash "composer" do
  code <<-EOH
    curl -s https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
  EOH
end
