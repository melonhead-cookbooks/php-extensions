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

  file '/etc/php.d/xhprof.ini' do
    action :create
    content "extension=xhprof.so\n"
    owner 'root'
    group 'root'
    mode 0644
    notifies :restart, resources(service: 'apache2')
  end
when 'debian'
  package 'php5-xhprof' do
    action :install
  end
end
