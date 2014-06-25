#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_apc
#
# Copyright 2014, Salesforce
#

case node['platform_family']
when 'rhel', 'fedora'
  %w{ httpd-devel pcre pcre-devel }.each do |pkg|
    package pkg do
      action :install
    end
  end
  php_pear 'APC' do
    action :install
    directives(:shm_size => '128M', :enable_cli => 0)
  end
when 'debian'
  package 'php-apc' do
    action :install
  end
end
