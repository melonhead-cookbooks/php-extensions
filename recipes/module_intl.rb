#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_intl
#
# Copyright 2014, Salesforce
#

case node['platform_family']
when 'rhel', 'fedora'
  package 'libicu-devel' do
    action :install
  end
  php_pear 'intl' do
    action :install
  end

  file '/etc/php.d/intl.ini' do
    action :create
    content "extension=intl.so\n"
    owner 'root'
    group 'root'
    mode 0644
    notifies :restart, resources(service: 'apache2')
  end
when 'debian'
  package 'php5-intl' do
    action :install
  end
end
