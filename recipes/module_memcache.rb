#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_memcache
#
# Copyright 2014, Salesforce
#

case node['platform_family']
when 'rhel', 'fedora'
  case node['platform_version']
  when 6
    %w{ php-pecl-memcached }.each do |pkg|
      package pkg do
        action :install
      end
    end
    file '/etc/php.d/memcached.ini' do
      action :create
      content "extension=memcached.so\n"
      owner 'root'
      group 'root'
      mode 0644
      notifies :restart, resources(service: 'apache2')
  end
  when 5
    package 'zlib-devel' do
      action :install
    end
    php_pear 'memcache' do
      action :install
    end
    file '/etc/php.d/memcached.ini' do
      action :create
      content "extension=xhprof.so\n"
      owner 'root'
      group 'root'
      mode 0644
      notifies :restart, resources(service: 'apache2')
  end
  end
when 'debian'
  package 'php5-memcache' do
    action :install
  end
end
