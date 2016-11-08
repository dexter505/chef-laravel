#
# Cookbook Name:: laravel
# Recipe:: packages
#
# Copyright 2013, Mathias Hansen
#

# Makes sure apt is up to date
include_recipe "apt"

# Add repositories
#apt_repository "php" do
#	uri "http://ppa.launchpad.net/ondrej/php"
#	distribution node['lsb']['codename']
#	components ["main"]
#	keyserver "keyserver.ubuntu.com"
#	key "E5267A6C"
#end

# Makes sure apt is up to date
#include_recipe "apt"

# Install packages
node['laravel']['packages'].each do |a_package|
  package a_package
end

bash "install php and modules" do
  user "root"
  cwd "/var/www/#{node['laravel']['name']}"
  code <<-EOH
  add-apt-repository ppa:ondrej/php
  apt-get -y update
  apt-get -y install php5.6 php5.6-dev php5.6-cli php-pear php5.6-apcu php5.6-mysql php5.6-curl php5.6-mcrypt php5.6-memcached php5.6-gd php5.6-json
  EOH
end

# Install npm packages
#include_recipe "npm"
#node['laravel']['npm_packages'].each do |a_package|
  #npm_package a_package
#end
