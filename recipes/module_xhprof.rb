#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_xhprof
#
# Copyright 2014, Salesforce, Inc.
#

case node['platform_family']
when 'rhel', 'fedora'
  php_pear 'xhprof' do
    action :install
  end
when 'debian'
  package 'php5-xhprof' do
    action :install
  end
end
