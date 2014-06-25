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
  file '/etc/php.d/xdebug.ini' do
    action :create
    content "[xdebug]\nzend_extension=xdebug.so\nxdebug.remote_enable = 1\n"
    owner 'root'
    group 'root'
    mode 0644
    notifies :restart, resources(service: 'apache2')
  end
when 'debian'
  package 'php5-xdebug' do
    action :install
  end
end
