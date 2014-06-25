#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_xdebug
#
# Copyright 2014, Salesforce
#

case node['platform_family']
when 'rhel', 'fedora'
  php_pear 'xdebug' do
    action :install
  end
when 'debian'
  package 'php5-xdebug' do
    action :install
  end
end
