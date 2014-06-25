#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_curl
#
# Copyright 2014, Salesforce
#

case node['platform_family']
when 'rhel', 'fedora'
  # centos php compiled with curl
when 'debian'
  package 'php5-curl' do
    action :upgrade
  end
end
