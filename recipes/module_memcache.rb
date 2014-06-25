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
  when 5
    package 'zlib-devel' do
      action :install
    end
    php_pear 'memcache' do
      action :install
    end
  end
when 'debian'
  package 'php5-memcache' do
    action :install
  end
end
