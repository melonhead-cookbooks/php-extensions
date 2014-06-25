#
# Author::  Danny Knapp (<dknapp@salesforce.com>)
# Cookbook Name:: php-extensions
# Recipe:: module_mysql
#
# Copyright 2014, Salesforce
#

pkg = value_for_platform(
  %w(centos redhat scientific fedora amazon) => {
    el5_range => 'php53-mysql',
    'default' => 'php-mysql'
  },
  'default' => 'php5-mysql'
)

package pkg do
  action :install
end
