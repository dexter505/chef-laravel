#
# Cookbook Name:: laravel
# Recipe:: packages
#
# Copyright 2013, Mathias Hansen
#

# Makes sure apt is up to date
include_recipe "apt"

# Add repositories
apt_repository "php56" do
	uri "http://ppa.launchpad.net/ondrej/php5/ubuntu"
	distribution node['lsb']['codename']
	components ["main"]
	keyserver "keyserver.ubuntu.com"
	key "E5267A6C"
end

# Install packages
node['laravel']['packages'].each do |a_package|
  package a_package
end

# Install npm packages
#include_recipe "npm"
#node['laravel']['npm_packages'].each do |a_package|
  #npm_package a_package
#end
