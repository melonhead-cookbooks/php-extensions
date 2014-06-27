#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_memcache
#
# Copyright 2014, Salesforce
#

case node['platform_family']
when 'rhel', 'fedora'
  if node['platform_version'].to_i < 6
    package 'zlib-devel' do
      action :install
    end
    php_pear 'memcache' do
      action :install
    end
    file '/etc/php.d/memcached.ini' do
      action :create
      content "extension=memcached.so\n"
      owner 'root'
      group 'root'
      mode 0644
      notifies :restart, resources(service: 'apache2')
    end
  else
    %w{ php-pecl-memcached }.each do |pkg|
      package pkg do
        action :install
      end
    end
  end
when 'debian'
  package 'php5-memcache' do
    action :install
  end
end
