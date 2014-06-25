#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_sqlite3
#
# Copyright 2014, Salesforce
#

case node['platform_family']
when 'rhel', 'fedora'
  # already there in centos, --with-pdo-sqlite=shared
when 'debian'
  package 'php5-sqlite' do
    action :install
  end
end
