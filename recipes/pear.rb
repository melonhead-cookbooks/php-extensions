#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: pear
#
# Copyright 2014, Salesforce
#

execute "download latest pear" do
  command "wget http://pear.php.net/install-pear-nozlib.phar"
  action :run
end

execute "install latest pear" do
  command "php install-pear-nozlib.phar"
  action :run
end

# update the main channels
php_pear_channel 'pear.php.net' do
  action :update
end

php_pear_channel 'pecl.php.net' do
  action :update
end

